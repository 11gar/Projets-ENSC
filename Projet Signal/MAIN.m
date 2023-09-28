clear all;
vidObj = VideoReader("vidéo.mp4");

img= read(vidObj,1);
%img=img(500:700,600:800,:);
%img=img(20:40,120:140,:);
A=img(:,:,3);
contours = trouvercontours(A);

B=binarize(contours,2).*255;
%over=overline(A,1,1,1080,1920);



briqueBleue=findexclusivecolor(img,38,60,174,50,50,50);
briqueBlanche=findexclusivecolor(img,210,210,210,70,70,70);

%briqueBleue=convolutionCouleurs(briqueBleue,"same");




figure(1),image(img);
figure(2), image(B);
figure(3), imagesc(briqueBleue),colormap("jet");
figure(4), imagesc(briqueBleue),colormap("jet");
%figure(5),image(over),colormap("jet");
