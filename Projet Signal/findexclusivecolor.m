function[res] = findexclusivecolor(matrix,Rs,Gs,Bs,Rtolerance,Gtolerance,Btolerance)
R1=matrix(:,:,1)>(Rs-Rtolerance);
R2=matrix(:,:,1)<(Rs+Rtolerance);

G1=matrix(:,:,2)>(Gs-Gtolerance);
G2=matrix(:,:,2)<(Gs+Gtolerance);

B1=matrix(:,:,3)>(Bs-Btolerance);
B2=matrix(:,:,3)<(Bs+Btolerance);

correctmatrix=(double(R1.*R2).*double(G1.*G2).*double(B1.*B2));
correctmatrix=correctmatrix(:,:)>0;

Rr=double(matrix(:,:,1)).*correctmatrix;
Gr=double(matrix(:,:,2)).*correctmatrix;
Br=double(matrix(:,:,3)).*correctmatrix;

res(:,:,1)=Rr./255;
res(:,:,2)=Gr./255;
res(:,:,3)=Br./255;