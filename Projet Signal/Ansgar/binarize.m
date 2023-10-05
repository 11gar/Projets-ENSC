function [res] = binarize(matrix,seuil)
res=matrix(:,:)>seuil;
end