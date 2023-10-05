clear all;
vidObj = VideoReader("vidéo.mp4");

img= read(vidObj,1);
%img=img(500:700,600:800,:);
%img=img(20:40,120:140,:);
[imgIndex,map]=rgb2ind(img,255);
%over=overline(A,1,1,1080,1920);



briqueBleue=findexclusivecolor(img,38,60,174,20,20,20);
briqueBlanche=findexclusivecolor(img,210,210,210,70,70,70);

[indexBleue,map]=rgb2ind(briqueBleue,255);
[X,Y,norme] = trouvercontours(indexBleue);
normeBin=binarize(norme,20);

%briqueBleue=convolutionCouleurs(briqueBleue,"same");


figure(2), imagesc(normeBin), colormap("gray");
figure(3), imagesc(briqueBleue),colormap("jet");
%figure(5),image(over),colormap("jet");
figure(1),imshow(img);
[x,y]=ginput(2);
xmid=(x(1)+x(2))/2;
ymid=(y(1)+y(2))/2;
vect=[(x(2)-x(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2)),(y(2)-y(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2))].*30
ortho=null(vect(:).').*50;
vect*ortho
line(x,y);
line([xmid,xmid-ortho(1)],[ymid,ymid-ortho(2)],'color','red')
line([x(1),x(1)+vect(1)],[y(1),y(1)+vect(2)],'color','red')
