function [Xt,Yt] = GradientTheorique(img,x,y)
M01=quadrangle_from_points(img,x,y);
[Xq,Yq,normeq] = trouvercontours(M01,4);
Xt=Xq;
Yt=Yq;
end

