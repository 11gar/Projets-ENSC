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
feuille = findexclusivecolor(img,128,168,177,70,70,70);
%normeBin=binarize(norme,20);

disp("-------------------------------")
imgTest=[ones(500),ones(500);zeros(500),zeros(500)];

figure(1),imshow(imgIndex,map);

[x,y]=ginput(2);

L = 1000; %largeur du rectangle
p = 80; %pourcentage pris du segment
%u, U, v, V
U = 7;
V = 30;

Xi = [x(1), y(1)];
Xj = [x(2),y(2)];
vectij = Xj - Xi;
ortho2=null(vectij(:).');

p=0.01*p;
M=zeros(2*U,2*V);
M(:,:,1)=0;
M(:,:,2)=0;

[X,Y,norme] = trouvercontours(imgIndex,2);

for u=-U:U
    for v=-V:V
        for i=1:2
            M(u+U+1,v+V+1,i) = round(Xi(i) + (0.5 +p*(u/(2*U)))*vectij(i) + L*(v/(2*V))*ortho2(i)/norm(vectij));
        end
    end
end



for u=-U:U
    for v=-V:V
        disp("tour");
        xEtudie=min(M(u+U+1,v+V+1,1),size(imgIndex,1));
        yEtudie=min(M(u+U+1,v+V+1,2),size(imgIndex,2));
        vecteur=[X(xEtudie,yEtudie)/norm(X(xEtudie,yEtudie),Y(xEtudie,yEtudie)),Y(xEtudie,yEtudie)/norm(X(xEtudie,yEtudie),Y(xEtudie,yEtudie))];
        disp(vecteur);
        disp(norme(xEtudie,yEtudie));
        ortho=null(vecteur(:).');
        line([yEtudie,yEtudie+ortho(2)*20*norme(xEtudie,yEtudie)/5],[xEtudie,xEtudie+ortho(1)*20*norme(xEtudie,yEtudie)/5],'color','red');
    end
end


