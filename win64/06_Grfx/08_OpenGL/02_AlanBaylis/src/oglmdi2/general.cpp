#include "general.h"

bool LoadTGA(TEXTURE *texture, char *filename)                              // Loads A TGA File Into Memory
{
    GLubyte TGAheader[12]={0,0,2,0,0,0,0,0,0,0,0,0};                        // Uncompressed TGA Header
    GLubyte TGAcompare[12];                                                 // Used To Compare TGA Header
    GLubyte header[6];                                                      // First 6 Useful Bytes From The Header
    GLuint  bytesPerPixel;                                                  // Holds Number Of Bytes Per Pixel Used In The TGA File
    GLuint  imageSize;                                                      // Used To Store The Image Size When Setting Aside Ram
    GLuint  temp;                                                           // Temporary Variable
    GLuint  type=GL_RGBA;                                                   // Set The Default GL Mode To RBGA (32 BPP)
    FILE *file = fopen(filename, "rb");                                     // Open The TGA Fi
    if( file==NULL ||                                                       // Does File Even Exist?
    fread(TGAcompare,1,sizeof(TGAcompare),file)!=sizeof(TGAcompare) ||      // Are There 12 Bytes To Read?
    memcmp(TGAheader,TGAcompare,sizeof(TGAheader))!=0               ||      // Does The Header Match What We Want?
    fread(header,1,sizeof(header),file)!=sizeof(header))                    // If So Read Next 6 Header Bytes
    {
        if (file == NULL)                                                   // Did The File Even Exist? *Added Jim Strong*
        {
            MessageBox(NULL,"Image file was not found","Error",MB_OK|MB_ICONERROR);
            return false;                                                   // Return False
        }
            if(TGAcompare[2] == 1)
                MessageBox(NULL,"Image cannot be indexed color. \r\n Convert the image to RGB or RGBA.","Error",MB_OK|MB_ICONERROR);
            if(TGAcompare[2] == 3)
                MessageBox(NULL,"Image cannot be greyscale color. \r\n Convert the image to RGB or RGBA.","Error",MB_OK|MB_ICONERROR);
            if(TGAcompare[2] == 9 || TGAcompare[2] == 10)
                MessageBox(NULL,"Image cannot be compressed. \r\n Convert the image to an uncompressed format.","Error",MB_OK|MB_ICONERROR);
            fclose(file);                                                   // If Anything Failed, Close The File
            return false;                                                   // Return False
        }
        texture->Width  = header[1] * 256 + header[0];                      // Determine The TGA Width      (highbyte*256+lowbyte)
        texture->Height = header[3] * 256 + header[2];                      // Determine The TGA Height     (highbyte*256+lowbyte)
        if( texture->Width  <=0     ||                                      // Is The Width Less Than Or Equal To Zero
        texture->Height <=0     ||                                          // Is The Height Less Than Or Equal To Zero
        (header[4]!=24 && header[4]!=32))                                   // Is The TGA 24 or 32 Bit?
        {
            fclose(file);                                                   // If Anything Failed, Close The File
            if(texture->Width  <=0 || texture->Height  <=0)
                MessageBox(NULL,"Image must have a width and height greater than 0","Error",MB_OK|MB_ICONERROR);
            if(header[4]!=24 && header[4]!=32)
                MessageBox(NULL,"Image must be 24 or 32 bit","Error",MB_OK|MB_ICONERROR);
            return false;                                               // Return False
        }
        texture->Bpp    = header[4];                                        // Grab The TGA's Bits Per Pixel (24 or 32)
        bytesPerPixel   = texture->Bpp/8;                                   // Divide By 8 To Get The Bytes Per Pixel
        imageSize       = texture->Width*texture->Height*bytesPerPixel;     // Calculate The Memory Required For The TGA Data
        texture->ImageData=(GLubyte *)malloc(imageSize);                    // Reserve Memory To Hold The TGA Data
        if( texture->ImageData==NULL ||                                     // Does The Storage Memory Exist?
        fread(texture->ImageData, 1, imageSize, file)!=imageSize)           // Does The Image Size Match The Memory Reserved?
        {
            if(texture->ImageData!=NULL)                                    // Was Image Data Loaded
                free(texture->ImageData);                                   // If So, Release The Image Data
            MessageBox(NULL,"Image load failed for unknown reason.","Error",MB_OK|MB_ICONERROR);
            fclose(file);                                                   // Close The File
            return false;                                                   // Return False
        }
        for(GLuint i=0; i<int(imageSize); i+=bytesPerPixel)                 // Loop Through The Image Data
        {                                                                   // Swaps The 1st And 3rd Bytes ('R'ed and 'B'lue)
            temp=texture->ImageData[i];                                     // Temporarily Store The Value At Image Data 'i'
            texture->ImageData[i] = texture->ImageData[i + 2];              // Set The 1st Byte To The Value Of The 3rd Byte
            texture->ImageData[i + 2] = temp;                               // Set The 3rd Byte To The Value In 'temp' (1st Byte Value)
        }
        fclose (file);                                                      // Close The File

        // Build A Texture From The Data
        glGenTextures(1, &texture[0].TexID);                                // Generate OpenGL texture IDs
        glBindTexture(GL_TEXTURE_2D, texture[0].TexID);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
        if (texture[0].Bpp==24)                                             // Was The TGA 24 Bits
        {
            type=GL_RGB;                                                    // If So Set The 'type' To GL_RGB
        }
        glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
        glTexImage2D(GL_TEXTURE_2D, 0, type, texture[0].Width, texture[0].Height, 0, type, GL_UNSIGNED_BYTE, texture[0].ImageData);
        gluBuild2DMipmaps(GL_TEXTURE_2D, type, texture[0].Width, texture[0].Height, type, GL_UNSIGNED_BYTE, texture[0].ImageData);
        free(texture->ImageData);
        return true;                                                        // Texture Building Went Ok, Return True
}


void SetGLProperties()
{
    glCullFace(GL_BACK);
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);    // This Will Clear The Background Color To Black
    glClearDepth(1.0);            // Enables Clearing Of The Depth Buffer
     glDepthFunc(GL_LESS);            // The Type Of Depth Test To Do
    glEnable(GL_DEPTH_TEST);        // Enables Depth Testing
    glShadeModel(GL_SMOOTH);        // Enables Smooth Color Shading
    glEnable(GL_NORMALIZE);
    glEnable(GL_CULL_FACE);
}

void SetGLView(int Width, int Height)
{
    if (Height==0)                // Prevent A Divide By Zero If The Window Is Too Small
        Height=1;

    glViewport(0, 0, Width, Height);    // Reset The Current Viewport And Perspective Transformation
    glMatrixMode(GL_PROJECTION);        // Select The Projection Matrix
    glLoadIdentity();            // Reset The Projection Matrix
      gluPerspective(45.0,(float)Width/(float)Height,0.1,200.0);    // Calculate The Aspect Ratio Of The Window
    glMatrixMode(GL_MODELVIEW);        // Select The Modelview Matrix
    glLoadIdentity();
}

void SetGLMaterial()
{
    float no_mat[] = { 0.0, 0.0, 0.0, 1.0 };
    float mat_ambient[] = { 0.4, 0.4, 0.4, 1.0 };
    float mat_diffuse[] = { 0.8, 0.8, 0.8, 1.0 };
    float mat_specular[] = { 0.9, 0.9, 0.9, 1.0 };
    float high_shininess[] = { 80.0 };

    glMaterialfv(GL_FRONT, GL_AMBIENT, mat_ambient);
    glMaterialfv(GL_FRONT, GL_SPECULAR, mat_specular);
    glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
    glMaterialfv(GL_FRONT, GL_EMISSION, no_mat);
    glMaterialfv(GL_FRONT, GL_SHININESS, high_shininess);
}

