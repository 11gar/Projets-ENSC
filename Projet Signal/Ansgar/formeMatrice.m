function M=formeMatrice(x1,y1,x2,y2)
x=[x1,x2];
y=[y1,y2];
L = 1000; %largeur du rectangle
p = 80; %pourcentage pris du segment
%u, U, v, V
U = 7;
V = 30;

Xi = [x(1), y(1)];
Xj = [x(2),y(2)];
vectij = Xj - Xi;
ortho2=null(vectij(:).');

p=0.01*p;
M=zeros(2*U,2*V);
M(:,:,1)=0;
M(:,:,2)=0;

for u=-U:U
    for v=-V:V
        for i=1:2
            M(u+U+1,v+V+1,i) = round(Xi(i) + (0.5 +p*(u/(2*U)))*vectij(i) + L*(v/(2*V))*ortho2(i)/norm(vectij));
        end
    end
end