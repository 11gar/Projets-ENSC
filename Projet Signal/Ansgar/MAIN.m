clear all;
vidObj = VideoReader("vidéo.mp4");

img= read(vidObj,1);
%img=img(500:700,600:800,:);
%img=img(20:40,120:140,:);
[imgIndex,map]=rgb2ind(img,255);
%over=overline(A,1,1,1080,1920);



briqueBleue=findexclusivecolor(img,38,60,174,20,20,20);
briqueBlanche=findexclusivecolor(img,210,210,210,70,70,70);
feuille = findexclusivecolor(img,128,168,177,70,70,70);
normeBin=binarize(norme,20);

%%
[indexBleue,map2]=rgb2ind(briqueBleue,255);
indexBleue=binarize(indexBleue,0.5);
indexBleue=convolutionCouleurs(indexBleue,9,"valid");
indexBleue=binarize(indexBleue,0.5);

[X,Y,norme] = trouvercontours(indexBleue,2);
figure(5), imshow(indexBleue), colormap(map2);
for x = 1:3:size(X,1)
    for y  = 1:3:size(X,2)
        if(norme(x,y)~=0)
            vecteur=[X(x,y)/sqrt(X(x,y)^2+Y(x,y)^2),Y(x,y)/sqrt(X(x,y)^2+Y(x,y)^2)];
            ortho=null(vecteur(:).');
            line([y,y+ortho(2)*norme(x,y)/5],[x,x+ortho(1)*norme(x,y)/5],'color','red');
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
figure(2), imagesc(normeBin), colormap("gray");
figure(3), imagesc(briqueBleue),colormap("jet");
%figure(5),image(over),colormap("jet");
figure(1),imshow(img);

[x,y]=ginput(2);
xmid=(x(1)+x(2))/2;
ymid=(y(1)+y(2))/2;
vect=[(x(2)-x(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2)),(y(2)-y(1))/(sqrt((x(2)-x(1))^2+(y(2)-y(1))^2))].*30
ortho=null(vect(:).').*50;
line(x,y);
%line([xmid,xmid-ortho(1)],[ymid,ymid-ortho(2)],'color','red')
%line([x(1),x(1)+vect(1)],[y(1),y(1)+vect(2)],'color','red')
line()
%%

