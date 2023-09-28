function[res] = findcolor(matrix,Rmin,Rmax,Gmin,Gmax,Rmin,Rmax)
R=matrix(:,:,1)>Rmin;
R=G(:,:)<Rmax;

G=matrix(:,:,1)>Bmin;
G=G(:,:)<Bmax;

B=matrix(:,:,1)>Bmin;
B=B(:,:)<Bmax;

res=[R,G,B];