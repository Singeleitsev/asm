void Set2DProjection(int iWidth, int iHeight)
{
    if(iHeight == 0)
    {
        iHeight = 1;
    }
    glViewport(0, 0, iWidth, iHeight);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-iWidth * 0.5, iWidth * 0.5, -iHeight * 0.5, iHeight * 0.5, -2000, 2000);
}

void Draw2DSceneTop(HWND hWnd)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glRotatef(90, 1, 0, 0);
    RECT WindowRect;
    GetClientRect(hWnd, &WindowRect);
/*
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(1.0, 0.0, 0.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        glVertex3f(-0.5 * WindowRect.right, 0, FrontDepth);
        glVertex3f(0.5 * WindowRect.right, 0, FrontDepth);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);

    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(0.0, 0.0, 1.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        glVertex3f(LeftDepth, 0,  0.5 * WindowRect.bottom);
        glVertex3f(LeftDepth, 0, -0.5 * WindowRect.bottom);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);
*/
    glDisable(GL_TEXTURE_2D);
    glDisable(GL_LIGHTING);
    glColor4f(0.0, 1.0, 0.0, 1.0);
    glPushMatrix();
    glBegin(GL_LINES);
        // Front Face
        glNormal3fv(&polygon[0].Vertex[0].nx);
        glVertex3fv(&polygon[0].Vertex[0].x);
        glVertex3fv(&polygon[0].Vertex[1].x);
        glVertex3fv(&polygon[0].Vertex[1].x);
        glVertex3fv(&polygon[0].Vertex[2].x);
        glVertex3fv(&polygon[0].Vertex[2].x);
        glVertex3fv(&polygon[0].Vertex[0].x);

        glVertex3fv(&polygon[1].Vertex[0].x);
        glVertex3fv(&polygon[1].Vertex[1].x);
        glVertex3fv(&polygon[1].Vertex[1].x);
        glVertex3fv(&polygon[1].Vertex[2].x);
        glVertex3fv(&polygon[1].Vertex[2].x);
        glVertex3fv(&polygon[1].Vertex[0].x);
        // Back Face
        glNormal3fv(&polygon[2].Vertex[0].nx);
        glVertex3fv(&polygon[2].Vertex[0].x);
        glVertex3fv(&polygon[2].Vertex[1].x);
        glVertex3fv(&polygon[2].Vertex[1].x);
        glVertex3fv(&polygon[2].Vertex[2].x);
        glVertex3fv(&polygon[2].Vertex[2].x);
        glVertex3fv(&polygon[2].Vertex[0].x);

        glVertex3fv(&polygon[3].Vertex[0].x);
        glVertex3fv(&polygon[3].Vertex[1].x);
        glVertex3fv(&polygon[3].Vertex[1].x);
        glVertex3fv(&polygon[3].Vertex[2].x);
        glVertex3fv(&polygon[3].Vertex[2].x);
        glVertex3fv(&polygon[3].Vertex[0].x);
        // Top Face
        glNormal3fv(&polygon[4].Vertex[0].nx);
        glVertex3fv(&polygon[4].Vertex[0].x);
        glVertex3fv(&polygon[4].Vertex[1].x);
        glVertex3fv(&polygon[4].Vertex[1].x);
        glVertex3fv(&polygon[4].Vertex[2].x);
        glVertex3fv(&polygon[4].Vertex[2].x);
        glVertex3fv(&polygon[4].Vertex[0].x);

        glVertex3fv(&polygon[5].Vertex[0].x);
        glVertex3fv(&polygon[5].Vertex[1].x);
        glVertex3fv(&polygon[5].Vertex[1].x);
        glVertex3fv(&polygon[5].Vertex[2].x);
        glVertex3fv(&polygon[5].Vertex[2].x);
        glVertex3fv(&polygon[5].Vertex[0].x);
        // Bottom Face
        glNormal3fv(&polygon[6].Vertex[0].nx);
        glVertex3fv(&polygon[6].Vertex[0].x);
        glVertex3fv(&polygon[6].Vertex[1].x);
        glVertex3fv(&polygon[6].Vertex[1].x);
        glVertex3fv(&polygon[6].Vertex[2].x);
        glVertex3fv(&polygon[6].Vertex[2].x);
        glVertex3fv(&polygon[6].Vertex[0].x);

        glVertex3fv(&polygon[7].Vertex[0].x);
        glVertex3fv(&polygon[7].Vertex[1].x);
        glVertex3fv(&polygon[7].Vertex[1].x);
        glVertex3fv(&polygon[7].Vertex[2].x);
        glVertex3fv(&polygon[7].Vertex[2].x);
        glVertex3fv(&polygon[7].Vertex[0].x);
        // Right face
        glNormal3fv(&polygon[8].Vertex[0].nx);
        glVertex3fv(&polygon[8].Vertex[0].x);
        glVertex3fv(&polygon[8].Vertex[1].x);
        glVertex3fv(&polygon[8].Vertex[1].x);
        glVertex3fv(&polygon[8].Vertex[2].x);
        glVertex3fv(&polygon[8].Vertex[2].x);
        glVertex3fv(&polygon[8].Vertex[0].x);

        glVertex3fv(&polygon[9].Vertex[0].x);
        glVertex3fv(&polygon[9].Vertex[1].x);
        glVertex3fv(&polygon[9].Vertex[1].x);
        glVertex3fv(&polygon[9].Vertex[2].x);
        glVertex3fv(&polygon[9].Vertex[2].x);
        glVertex3fv(&polygon[9].Vertex[0].x);
        // Left Face
        glNormal3fv(&polygon[10].Vertex[0].nx);
        glVertex3fv(&polygon[10].Vertex[0].x);
        glVertex3fv(&polygon[10].Vertex[1].x);
        glVertex3fv(&polygon[10].Vertex[1].x);
        glVertex3fv(&polygon[10].Vertex[2].x);
        glVertex3fv(&polygon[10].Vertex[2].x);
        glVertex3fv(&polygon[10].Vertex[0].x);

        glVertex3fv(&polygon[11].Vertex[0].x);
        glVertex3fv(&polygon[11].Vertex[1].x);
        glVertex3fv(&polygon[11].Vertex[1].x);
        glVertex3fv(&polygon[11].Vertex[2].x);
        glVertex3fv(&polygon[11].Vertex[2].x);
        glVertex3fv(&polygon[11].Vertex[0].x);
    glEnd();
    glPopMatrix();
    glEnable(GL_LIGHTING);
    glEnable(GL_TEXTURE_2D);

float mat_ambient[] = { 0.8, 0.5, 0.1, 1.0 };
float mat_diffuse[] = { 0.8, 0.5, 0.1, 1.0 };
glMaterialfv(GL_FRONT, GL_AMBIENT, mat_ambient);
glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
glDisable(GL_TEXTURE_2D);
glPushMatrix();
glTranslatef(vertex[VertexNumber].x, vertex[VertexNumber].y, vertex[VertexNumber].z);
gluQuadricOrientation(sphere, GLU_OUTSIDE);
gluSphere(sphere,10.0,20,20);
glPopMatrix();
glEnable(GL_TEXTURE_2D);

}
