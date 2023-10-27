clear all;
vidObj = VideoReader("vidéo.mp4");

img= read(vidObj,1);
imgTest=[ones(500),ones(500);zeros(500),zeros(500)];
%img=img(500:700,600:800,:);
%img=img(20:40,120:140,:);
[imgIndex,map]=rgb2ind(img,255);
%over=overline(A,1,1,1080,1920);



briqueBleue=findexclusivecolor(img,38,60,174,20,20,20);
briqueBlanche=findexclusivecolor(img,165,170,185,15,15,15);
feuille = findexclusivecolor(img,128,168,177,70,70,70);
%normeBin=binarize(norme,20);

%%
[indexBleue,map2]=rgb2ind(briqueBleue,255);
indexBleue=binarize(indexBleue,0.5);
indexBleue=convolutionCouleurs(indexBleue,12,"valid");
indexBleue=binarize(indexBleue,0.5);

[X,Y,norme] = trouvercontours(indexBleue,2);
figure(5), imshow(indexBleue), colormap(map2);
for x = 1:3:size(X,1)
    for y  = 1:3:size(X,2)
        if(norme(x,y)~=0)
            vecteur=[X(x,y)/sqrt(X(x,y)^2+Y(x,y)^2),Y(x,y)/sqrt(X(x,y)^2+Y(x,y)^2)];
            ortho=null(vecteur(:).');
            %line([y,y+ortho(2)*norme(x,y)/5],[x,x+ortho(1)*norme(x,y)/5],'color','red');
        end
    end
end

%briqueBleue=convolutionCouleurs(briqueBleue,"same");
%%
[x,y]=ginput(2);
xmid=(x(1)+x(2))/2;
ymid=(y(1)+y(2))/2;
vect=[(x(2)-x(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2)),(y(2)-y(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2))].*30
ortho=null(vect(:).').*50;
line(x,y);
line([xmid,xmid-ortho(1)],[ymid,ymid-ortho(2)],'color','red')
line([x(1),x(1)+vect(1)],[y(1),y(1)+vect(2)],'color','red')

%%
%figure(2), imagesc(normeBin), colormap("gray");
%figure(3), imagesc(briqueBleue),colormap("jet");
%figure(5),image(over),colormap("jet");
figure(1),imshow(imgTest);



[x,y]=ginput(2);
xmid=(x(1)+x(2))/2;
ymid=(y(1)+y(2))/2;
vect=[(x(2)-x(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2)),(y(2)-y(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2))].*30;
ortho=null(vect(:).').*50;
line(x,y,'color','red');
%line([xmid,xmid-ortho(1)],[ymid,ymid-ortho(2)],'color','red')
%line([x(1),x(1)+vect(1)],[y(1),y(1)+vect(2)],'color','red')
[xr1,yr1,xr2,yr2,xr3,yr3]=rectangleAutourDeLigne(x(1),y(1),x(2),y(2),4,80);
[xp,yp]=ginput(1);




%%
[indexBleue,map2]=rgb2ind(briqueBleue,255);
indexBleue=binarize(indexBleue,0.5);
indexBleue=convolutionCouleurs(indexBleue,12,"valid");
indexBleue=binarize(indexBleue,0.5);

[X,Y,norme] = trouvercontours(indexBleue,2);
figure(5), imshow(indexBleue), colormap(map2);

[x,y]=ginput(2);
line(x,y,'color','red');
[xr1,yr1,xr2,yr2,xr3,yr3]=rectangleAutourDeLigne(x(1),y(1),x(2),y(2),0.5,80);

moy=[0,0,0];
nb=0;
for x = round(xr1):3:round(xr3)
    for y  = round(yr1):3:round(yr3)
        if(estDansRectangle(x,y,xr1,yr1,xr2,yr2,xr3,yr3))
            nb=nb+1;
            moy=moy+[X(y,x),Y(y,x),norme(y,x)];
        end
    end
end
moy=moy./nb;
line([x(1),x(1)+moy(1)*moy(3)*20],[y(1),y(1)+moy(2)*moy(3)*20],'color',"white");

%%
clear all;
vidObj = VideoReader("vidéo.mp4");

img= read(vidObj,1);
%img=img(500:700,600:800,:);
%img=img(20:40,120:140,:);
[imgIndex,map]=rgb2ind(img,255);
%over=overline(A,1,1,1080,1920);



briqueBleue=findexclusivecolor(img,38,60,174,20,20,20);
briqueBlanche=findexclusivecolor(img,165,170,185,15,15,15);
imgIndex=rgb2ind(briqueBlanche,255);
feuille = findexclusivecolor(img,128,168,177,70,70,70);
%normeBin=binarize(norme,20);

disp("-------------------------------")
imgTest=[ones(500),ones(500);zeros(500),zeros(500)];

figure(1),image(imgIndex),colormap(map);

[x,y]=ginput(4);
[M1,M2,M3,M4]=formeMatrices(x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4));
M01=quadrangle_from_points(imgIndex,x,y);

[Xq,Yq,normeq] = trouvercontours(M01,4);
[Xi,Yi,normei] = trouvercontours(imgIndex,4);

figure(2),imagesc(normeq);
figure(3),imagesc(normei);

%line([M(1,1,1),M(size(M,1),size(M,2),1)],[M(1,1,2),M(size(M,1),size(M,2),2)]);
hold on
plot(M1(:,:,1),M1(:,:,2),'+');
plot(M2(:,:,1),M2(:,:,2),'+');
plot(M3(:,:,1),M3(:,:,2),'+');
plot(M4(:,:,1),M4(:,:,2),'+');
hold off


