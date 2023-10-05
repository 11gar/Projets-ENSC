function[res] = findcolor2(matrix,Rs,Gs,Bs,tolerance)
R1=matrix(:,:,1)>(Rs-tolerance);
R2=matrix(:,:,1)<(Rs+tolerance);

G1=matrix(:,:,2)>(Gs-tolerance);
G2=matrix(:,:,2)<(Gs+tolerance);

B1=matrix(:,:,3)>(Bs-tolerance);
B2=matrix(:,:,3)<(Bs+tolerance);

Rr=double(matrix(:,:,1)).*double(R1.*R2);
Gr=double(matrix(:,:,2)).*double(G1.*G2);
Br=double(matrix(:,:,3)).*double(B1.*B2);

res(:,:,1)=Rr;
res(:,:,2)=Gr;
res(:,:,3)=Br;
