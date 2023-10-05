function[Gx,Gy,norme] = trouvercontours(matrix)
sigma=1;
[X,Y]=meshgrid(-sigma*3-0.5:0.5+sigma*3);
Hx=-X.*exp(-(X.^2+Y.^2)/(2*sigma^2));
Hy=-Y.*exp(-(X.^2+Y.^2)/(2*sigma^2));
Gx=conv2(matrix,Hx,'same');
Gy=conv2(matrix,Hy,'same');
norme=((Gx.*Gx+Gy.*Gy).^0.5)/sigma;