clear all;
vidObj = VideoReader("vidéo.mp4");

img= read(vidObj,1);
%img=img(500:700,600:800,:);
%img=img(20:40,120:140,:);
[imgIndex,map]=rgb2ind(img,255);
%over=overline(A,1,1,1080,1920);



briqueBleue=findexclusivecolor(img,38,60,174,50,50,50);
briqueBlanche=findexclusivecolor(img,210,210,210,70,70,70);

[indexBleue,map]=rgb2ind(briqueBleue,255);
[X,Y,norme] = trouvercontours(indexBleue);
normeBin=binarize(norme,10);

%briqueBleue=convolutionCouleurs(briqueBleue,"same");

figure(1),image(img);
figure(2), imagesc(normeBin), colormap("jet");
figure(3), imagesc(briqueBleue),colormap("jet");
%figure(5),image(over),colormap("jet");
