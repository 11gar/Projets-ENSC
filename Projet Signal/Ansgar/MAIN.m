clear all;
vidObj = VideoReader("vidéo.mp4");

img= read(vidObj)
%img=img(500:700,600:800,:);
%img=img(20:40,120:140,:);
[~,map]=rgb2ind(img,255);
%over=overline(A,1,1,1080,1920
% );    

briqueBleue=findexclusivecolor(img,38,60,174,20,20,20);
briqueBlanche=findexclusivecolor(img,165,170,185,15,15,15);
imgIndex=rgb2ind(briqueBlanche,255);
feuille = findexclusivecolor(img,128,168,177,70,70,70);
%normeBin=binarize(norme,20);

disp("-------------------------------")
imgTest=[ones(500),ones(500);zeros(500),zeros(500)];

figure(1),image(imgIndex),colormap(map);

[x,y]=ginput(4);
x=round(x);
y=round(y);
xp=x;
yp=y;

[M1x,M2x,M3x,M4x]=formeMatrices(xp(1),yp(1),xp(2),yp(2),xp(3),yp(3),xp(4),yp(4));


[x,y]=CorrectionRectangleSave(imgIndex,x,y,75,500,3);
figure(3),imagesc(imgIndex);


hold on
plot(xp,yp,'color','red');
line([xp(1),xp(4)],[yp(1),yp(4)])
plot(x,y);
line([x(1),x(4)],[y(1),y(4)])
%plot(M1(:,:,1),M1(:,:,2),'+',Color='red');
%plot(M2(:,:,1),M2(:,:,2),'+',Color='red');
%plot(M3(:,:,1),M3(:,:,2),'+',Color='red');
%plot(M4(:,:,1),M4(:,:,2),'+',Color='red');
%plot(M1x(:,:,1),M1x(:,:,2),'+',Color='yellow');
%plot(M2x(:,:,1),M2x(:,:,2),'+',Color='yellow');
%plot(M3x(:,:,1),M3x(:,:,2),'+',Color='yellow');
%plot(M4x(:,:,1),M4x(:,:,2),'+',Color='yellow');
hold off


%%
clear all;
findAllFrames("vidéo.mp4",100);


