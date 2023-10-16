function[xr1,yr1,xr2,yr2,xr3,yr3] = rectangleAutourDeLigne(x1,y1,x2,y2,cote,longueur)
x=[x1,x2];
y=[y1,y2];

vect=[x(2)-x(1),y(2)-y(1)];
vectUnit=[(x(2)-x(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2)),(y(2)-y(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2))].*30;

ortho=null(vectUnit(:).').*50;

xr1=x(1)-ortho(1)*cote/2+(vect(1)*(100-longueur)*0.01);
xr2=x(2)-ortho(1)*cote/2-(vect(1)*(100-longueur)*0.01);
xr4=x(2)+ortho(1)*cote/2-(vect(1)*(100-longueur)*0.01);
xr3=x(1)+ortho(1)*cote/2+(vect(1)*(100-longueur)*0.01);

yr1=y(1)-ortho(2)*cote/2+(vect(2)*(100-longueur)*0.01);
yr2=y(2)-ortho(2)*cote/2-(vect(2)*(100-longueur)*0.01);
yr4=y(2)+ortho(2)*cote/2-(vect(2)*(100-longueur)*0.01);
yr3=y(1)+ortho(2)*cote/2+(vect(2)*(100-longueur)*0.01);

line([xr1, xr2],[yr1, yr2]);
line([xr1, xr3],[yr1, yr3]);
line([xr2, xr4],[yr2, yr4]);
line([xr4, xr3],[yr4, yr3]);

