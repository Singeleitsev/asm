void Set3DProjection(int iWidth, int iHeight)
{
    if(iHeight == 0)
    {
        iHeight = 1;
    }
    glViewport(0, 0, iWidth, iHeight);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0,(float)iWidth/(float)iHeight, 1, 1000.0);
}

void Draw3DScene(void)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    if(g_bMouseDrag)                                       // If left mouse button is down
    {
        g_fCubeRotationX += (float)g_iMouseDeltaY * 0.5;   // Apply mouse deltas to cube rotation values
        g_fCubeRotationY += (float)g_iMouseDeltaX * 0.5;
    }

    glTranslatef(0.0,0.0,-500.0);
    glRotatef(g_fCubeRotationX,1.0,0.0,0.0);
    glRotatef(g_fCubeRotationY,0.0,1.0,0.0);

    glBindTexture(GL_TEXTURE_2D, texture[0].TexID);
    glPushMatrix();
    glBegin(GL_TRIANGLES);
        // Front Face
        glNormal3fv(&polygon[0].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[0].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[0].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[0].Vertex[2].x);

        glNormal3fv(&polygon[1].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[1].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[1].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[1].Vertex[2].x);
        // Back Face
        glNormal3fv(&polygon[2].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[2].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[2].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[2].Vertex[2].x);

        glNormal3fv(&polygon[3].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[3].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[3].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[3].Vertex[2].x);
        // Top Face
        glNormal3fv(&polygon[4].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[4].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[4].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[4].Vertex[2].x);

        glNormal3fv(&polygon[5].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[5].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[5].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[5].Vertex[2].x);
        // Bottom Face
        glNormal3fv(&polygon[6].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[6].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[6].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[6].Vertex[2].x);

        glNormal3fv(&polygon[7].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[7].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[7].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[7].Vertex[2].x);
        // Right face
        glNormal3fv(&polygon[8].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[8].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[8].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[8].Vertex[2].x);

        glNormal3fv(&polygon[9].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[9].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[9].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[9].Vertex[2].x);
        // Left Face
        glNormal3fv(&polygon[10].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[10].Vertex[0].x);
        glTexCoord2f(1.0f, 0.0f); glVertex3fv(&polygon[10].Vertex[1].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[10].Vertex[2].x);

        glNormal3fv(&polygon[11].Vertex[0].nx);
        glTexCoord2f(0.0f, 0.0f); glVertex3fv(&polygon[11].Vertex[0].x);
        glTexCoord2f(1.0f, 1.0f); glVertex3fv(&polygon[11].Vertex[1].x);
        glTexCoord2f(0.0f, 1.0f); glVertex3fv(&polygon[11].Vertex[2].x);
    glEnd();
    glPopMatrix();
}