void SetPolygons()
{
// Set cubes polygons

//Front
    polygon[0].Vertex[0] = vertex[0];
    polygon[0].Vertex[1] = vertex[1];
    polygon[0].Vertex[2] = vertex[2];

    polygon[1].Vertex[0] = vertex[0];
    polygon[1].Vertex[1] = vertex[2];
    polygon[1].Vertex[2] = vertex[3];
//Back
    polygon[2].Vertex[0] = vertex[5];
    polygon[2].Vertex[1] = vertex[4];
    polygon[2].Vertex[2] = vertex[7];

    polygon[3].Vertex[0] = vertex[5];
    polygon[3].Vertex[1] = vertex[7];
    polygon[3].Vertex[2] = vertex[6];
//Left
    polygon[4].Vertex[0] = vertex[4];
    polygon[4].Vertex[1] = vertex[0];
    polygon[4].Vertex[2] = vertex[3];

    polygon[5].Vertex[0] = vertex[4];
    polygon[5].Vertex[1] = vertex[3];
    polygon[5].Vertex[2] = vertex[7];
//Right
    polygon[6].Vertex[0] = vertex[1];
    polygon[6].Vertex[1] = vertex[5];
    polygon[6].Vertex[2] = vertex[6];

    polygon[7].Vertex[0] = vertex[1];
    polygon[7].Vertex[1] = vertex[6];
    polygon[7].Vertex[2] = vertex[2];
//Top
    polygon[8].Vertex[0] = vertex[3];
    polygon[8].Vertex[1] = vertex[2];
    polygon[8].Vertex[2] = vertex[6];

    polygon[9].Vertex[0] = vertex[3];
    polygon[9].Vertex[1] = vertex[6];
    polygon[9].Vertex[2] = vertex[7];
//Bottom
    polygon[10].Vertex[0] = vertex[5];
    polygon[10].Vertex[1] = vertex[1];
    polygon[10].Vertex[2] = vertex[0];

    polygon[11].Vertex[0] = vertex[5];
    polygon[11].Vertex[1] = vertex[0];
    polygon[11].Vertex[2] = vertex[4];

    polygon[0].SetNormal();
    polygon[1].SetNormal();
    polygon[2].SetNormal();
    polygon[3].SetNormal();
    polygon[4].SetNormal();
    polygon[5].SetNormal();
    polygon[6].SetNormal();
    polygon[7].SetNormal();
    polygon[8].SetNormal();
    polygon[9].SetNormal();
    polygon[10].SetNormal();
    polygon[11].SetNormal();
}
