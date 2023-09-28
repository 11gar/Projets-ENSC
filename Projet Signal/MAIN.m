vidObj = VideoReader("vidéo.mp4");
img= read(vidObj,1);
A=img(:,:,3);
contours = trouvercontours(A);

B=binarize(contours,2).*255;
over=overline(A,1,1,1080,1920);

figure(1),image(img);
figure(2), image(B);
figure(3), image(over),colormap("jet");

