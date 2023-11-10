function [X,Y] = GradientEffectif(img)
[Xi,Yi,normei] = trouvercontours(img,4);
X=Xi;
Y=Yi;
end