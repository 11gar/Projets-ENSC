function[res]=overline(img, x1,y1,x2,y2)
X=img(x1:x2,y1:y2);
whos("X")
contours=binarize(trouvercontours(X),2);
whos("contours")
res=double(X)+(double(contours).*255);
