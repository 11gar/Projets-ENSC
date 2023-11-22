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
x=round(x);
y=round(y);
xp=x;
yp=y;
M01=quadrangle_from_points(imgIndex,x,y);
[X1,Y1]=GradientTheorique(imgIndex,x,y);
[X2,Y2]=GradientEffectif(imgIndex);
c=gradient_correlation(X1,Y1,X2,Y2);
lambda=300;
    Eps=3;
params=[x,y];
[M1,M2,M3,M4]=formeMatrices(x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4));
[M1x,M2x,M3x,M4x]=formeMatrices(xp(1),yp(1),xp(2),yp(2),xp(3),yp(3),xp(4),yp(4));

    %------------BOUCLE----------
    figure(3),imagesc(X2);
hold on

for i=1:75
    plot(params(:,1),params(:,2));
    line([params(1,1),params(1,2)],[params(1,1),params(1,2)])
    %------Correlation avant
    Cote1InteretX=zeros(15,101);
    Cote2InteretX=zeros(15,101);
    Cote3InteretX=zeros(15,101);
    Cote4InteretX=zeros(15,101);
    Cote1InteretY=zeros(15,101);
    Cote2InteretY=zeros(15,101);
    Cote3InteretY=zeros(15,101);
    Cote4InteretY=zeros(15,101);

    Cote1InteretXTh=zeros(15,101);
    Cote2InteretXTh=zeros(15,101);
    Cote3InteretXTh=zeros(15,101);
    Cote4InteretXTh=zeros(15,101);
    Cote1InteretYTh=zeros(15,101);
    Cote2InteretYTh=zeros(15,101);
    Cote3InteretYTh=zeros(15,101);
    Cote4InteretYTh=zeros(15,101);

    for x=1:15
        for y=1:101
        Cote1InteretX(x,y)=X2(M1(x,y,2),M1(x,y,1));
        Cote2InteretX(x,y)=X2(M2(x,y,2),M2(x,y,1));
        Cote3InteretX(x,y)=X2(M3(x,y,2),M3(x,y,1));
        Cote4InteretX(x,y)=X2(M4(x,y,2),M4(x,y,1));

        Cote1InteretY(x,y)=Y2(M1(x,y,2),M1(x,y,1));
        Cote2InteretY(x,y)=Y2(M2(x,y,2),M2(x,y,1));
        Cote3InteretY(x,y)=Y2(M3(x,y,2),M3(x,y,1));
        Cote4InteretY(x,y)=Y2(M4(x,y,2),M4(x,y,1));
        end
    end

    [X1,Y1]=GradientTheorique(imgIndex,params(:,1),params(:,2));
    for x=1:15
        for y=1:101
        Cote1InteretXTh(x,y)=X1(M1(x,y,2),M1(x,y,1));
        Cote2InteretXTh(x,y)=X1(M2(x,y,2),M2(x,y,1));
        Cote3InteretXTh(x,y)=X1(M3(x,y,2),M3(x,y,1));
        Cote4InteretXTh(x,y)=X1(M4(x,y,2),M4(x,y,1));

        Cote1InteretYTh(x,y)=Y1(M1(x,y,2),M1(x,y,1));
        Cote2InteretYTh(x,y)=Y1(M2(x,y,2),M2(x,y,1));
        Cote3InteretYTh(x,y)=Y1(M3(x,y,2),M3(x,y,1));
        Cote4InteretYTh(x,y)=Y1(M4(x,y,2),M4(x,y,1));
        end
    end
    C1=gradient_correlation(Cote1InteretX,Cote1InteretY,Cote1InteretXTh,Cote1InteretYTh);
    C2=gradient_correlation(Cote2InteretX,Cote2InteretY,Cote2InteretXTh,Cote2InteretYTh);
    C3=gradient_correlation(Cote3InteretX,Cote3InteretY,Cote3InteretXTh,Cote3InteretYTh);
    C4=gradient_correlation(Cote4InteretX,Cote4InteretY,Cote4InteretXTh,Cote4InteretYTh);
    F1=1-(C1+C2+C3+C4)/4
    %------Correlation après-------
    k=randi(8);
    params2=params;
    params2(k)=params(k)+Eps;
    [X1,Y1]=GradientTheorique(imgIndex,params2(:,1),params2(:,2));

    for x=1:15
        for y=1:101
        Cote1InteretXTh(x,y)=X1(M1(x,y,2),M1(x,y,1));
        Cote2InteretXTh(x,y)=X1(M2(x,y,2),M2(x,y,1));
        Cote3InteretXTh(x,y)=X1(M3(x,y,2),M3(x,y,1));
        Cote4InteretXTh(x,y)=X1(M4(x,y,2),M4(x,y,1));

        Cote1InteretYTh(x,y)=Y1(M1(x,y,2),M1(x,y,1));
        Cote2InteretYTh(x,y)=Y1(M2(x,y,2),M2(x,y,1));
        Cote3InteretYTh(x,y)=Y1(M3(x,y,2),M3(x,y,1));
        Cote4InteretYTh(x,y)=Y1(M4(x,y,2),M4(x,y,1));
        end
    end
    C1=gradient_correlation(Cote1InteretX,Cote1InteretY,Cote1InteretXTh,Cote1InteretYTh);
    C2=gradient_correlation(Cote2InteretX,Cote2InteretY,Cote2InteretXTh,Cote2InteretYTh);
    C3=gradient_correlation(Cote3InteretX,Cote3InteretY,Cote3InteretXTh,Cote3InteretYTh);
    C4=gradient_correlation(Cote4InteretX,Cote4InteretY,Cote4InteretXTh,Cote4InteretYTh);
    F2=1-(C1+C2+C3+C4)/4;
    params(k)=round(params(k)+lambda*(F2-F1)/Eps);
end

figure(2),imagesc(X1);
figure(3),imagesc(X2);
x=params(:,1);
y=params(:,2);
%line([M(1,1,1),M(size(M,1),size(M,2),1)],[M(1,1,2),M(size(M,1),size(M,2),2)]);
[M1,M2,M3,M4]=formeMatrices(x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4));


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


