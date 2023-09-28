function[res] = convolutionCouleurs(matrix,mode)
R=matrix(:,:,1);
G=matrix(:,:,2);
B=matrix(:,:,3);

H=ones(5)/25;

R2=conv2(R,H,"same");
G2=conv2(G,H,"same");
B2=conv2(B,H,"same");
R2

res(:,:,1)=R2./255;
res(:,:,2)=G2./255;
res(:,:,3)=B2./255;