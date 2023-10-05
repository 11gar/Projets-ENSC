clear all;
vidObj = VideoReader("vidéo.mp4");

img= read(vidObj,1);
[imgIndex,map]=rgb2ind(img,255);

contours = trouvercontours(imgIndex);
contours = binarize(contours,20).*255;

figure(1), imagesc(img), colormap(map);

