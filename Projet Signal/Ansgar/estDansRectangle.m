function[res] = estDansRectangle(xpoint,ypoint,x1,y1,x2,y2,x3,y3)
vecteurPoint=[x1 y1; xpoint ypoint];
vecteurRectangle=[x1 y1; x2 y2];
vecteurRectangle2=[x1 y1; x3 y3];

if(vecteurPoint*vecteurRectangle<vecteurPoint*vecteurPoint && vecteurPoint*vecteurRectangle>0 && vecteurPoint*vecteurRectangle2<vecteurPoint*vecteurPoint && vecteurPoint*vecteurRectangle2>0)
    res=true;
else
    res=false;
end