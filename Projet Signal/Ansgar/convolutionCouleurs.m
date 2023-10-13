function[res] = convolutionCouleurs(matrix,rayon,mode)
H=ones(rayon)/25;
res=conv2(matrix,H,mode);

