function[res] = rectangleAutourDeLigne(x1,y1,x2,y2,cote,longueur)
x=[x1,x2];
y=[y1,y2];

vect=[x(2)-x(1),y(2)-y(1)];
vectUnit=[(x(2)-x(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2)),(y(2)-y(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2))].*30

x=[x1+vect]

ortho=null(vectUnit(:).').*50;

line([x(1)-ortho(1)*cote/2, x(2)-ortho(1)*cote/2],[y(1)-ortho(2)*cote/2, y(2)-ortho(2)*cote/2]);
line([x(1)-ortho(1)*cote/2, x(1)+ortho(1)*cote/2],[y(1)-ortho(2)*cote/2, y(1)+ortho(2)*cote/2]);
line([x(2), x(2)+ortho(1)*2],[y(2), y(2)+ortho(2)*2]);
line([x(1)+ortho(1)*cote/2, x(2)+ortho(1)*cote/2],[y(1)+ortho(2)*cote/2, y(2)+ortho(2)*cote/2]);

res=0;