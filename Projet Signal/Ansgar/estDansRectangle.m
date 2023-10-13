function[res] = estDansRectangle(xpoint,ypoint,x1,y1,x2,y2,x3,y3)
line([x1,x2],[y1,y2],'color','red');
line([x1,x3],[y1,y3],'color','red');
vecteurPoint=[xpoint-x1 ypoint-y1];
whos vecteurPoint;
vecteurRectangle=[x2-x1 y2-y1];
vecteurRectangle2=[x3-x1 y3-y1];

if((dot(vecteurPoint,vecteurRectangle)<dot(vecteurRectangle,vecteurRectangle)) & (dot(vecteurPoint,vecteurRectangle)>0)&(dot(vecteurPoint,vecteurRectangle2)<dot(vecteurRectangle2,vecteurRectangle2)) & (dot(vecteurPoint,vecteurRectangle2)>0))
    res=true;
    disp('true');
    disp(dot(vecteurPoint,vecteurRectangle))
else
    res=false;  
    disp("false");
end