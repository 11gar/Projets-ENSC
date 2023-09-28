function[res] = findcolor(matrix,Rs,Gs,Bs,Rtolerance,Gtolerance,Btolerance)
R1=matrix(:,:,1)>(Rs-Rtolerance);
R2=matrix(:,:,1)<(Rs+Rtolerance);

G1=matrix(:,:,2)>(Gs-Gtolerance);
G2=matrix(:,:,2)<(Gs+Gtolerance);

B1=matrix(:,:,3)>(Bs-Btolerance);
B2=matrix(:,:,3)<(Bs+Btolerance);

Rr=double(matrix(:,:,1)).*double(R1.*R2);
Gr=double(matrix(:,:,2)).*double(G1.*G2);
Br=double(matrix(:,:,3)).*double(B1.*B2);

res(:,:,1)=Rr;
res(:,:,2)=Gr;
res(:,:,3)=Br;
