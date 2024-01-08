// Texture Class    by Alan Baylis 2001

#ifndef TextureH
#define TextureH

#include "shared.h"

class TEXTURE
{
public:
    TEXTURE();
      ~TEXTURE();

        bool LoadTGA();

      char TexName[20];
        GLubyte* ImageData;                                                     // Image Data (Up To 32 Bits)
        GLuint  Bpp;                                                            // Image Color Depth In Bits Per Pixel
        GLuint  Width;                                                          // Image Width
        GLuint  Height;                                                         // Image Height
        GLuint  TexID;                                                          // Texture ID Used To Select A Texture
      float Vert1x;
      float Vert1y;
      float Vert2x;
      float Vert2y;
      float Vert3x;
      float Vert3y;
};

#endif

