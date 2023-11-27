function[Gx,Gy,norme] = trouvercontours(matrix,sigma)
[X,Y]=meshgrid(-sigma*3-0.5:0.5+sigma*3);
Hx=-X.*exp(-(X.^2+Y.^2)/(2*sigma^2));
Hy=-Y.*exp(-(X.^2+Y.^2)/(2*sigma^2));
Gx=convn(matrix,Hx,'same');
Gy=convn(matrix,Hy,'same');
norme=((Gx.*Gx+Gy.*Gy).^0.5)/sigma;