function C = gradient_correlation(X1, Y1, X2, Y2)

X1 = X1(:)';
Y1 = Y1(:)';
X2 = X2(:)';
Y2 = Y2(:)';
d = X1.*X2+Y1.*Y2;
pos = find(d<0);
X2(pos) = -X2(pos);
Y2(pos) = -Y2(pos);
n1 = sqrt(sum(X1.*X1+Y1.*Y1)); n1 = n1+(n1==0);
n2 = sqrt(sum(X2.*X2+Y2.*Y2)); n2 = n2+(n2==0);
C = sum(X1.*X2+Y1.*Y2)/(n1*n2);
end