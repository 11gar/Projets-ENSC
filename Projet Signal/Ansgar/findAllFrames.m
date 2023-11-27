function coords = findAllFrames(path,start)
disp("-----------START-------------")
vidObj = VideoReader(path);
tic
allframes = read(vidObj);
toc
whos allframes
%vid=read(vidObj,start);
%whos vid
tailleVid=size(allframes(:,:,:,1),4);
coords=zeros(tailleVid,4,2);
[~,map]=rgb2ind(allframes(:,:,:,1),255);
briqueBlanche=findexclusivecolor(allframes(:,:,:,1),165,170,185,15,15,15);
imgIndex=rgb2ind(briqueBlanche,255);
figure(1),image(imgIndex),colormap(map);
[x,y]=ginput(4);
x=round(x);
y=round(y);

for i=start:start+5
    tic
    img=allframes(:,:,:,i);
    toc
    tic
    briqueBlanche=findexclusivecolor(img,165,170,185,15,15,15);
    img=rgb2ind(briqueBlanche,255); 
    toc
    disp(i);
    disp("-------------------------------")
    tic
    [tempx,tempy]=CorrectionRectangleSave(img,x,y,75,500,3);
    toc
    tic
    coords(i,1,1)=tempx(1);
    coords(i,1,2)=tempy(1);
    coords(i,2,1)=tempx(2);
    coords(i,2,2)=tempy(2);
    coords(i,3,1)=tempx(3);
    coords(i,3,2)=tempy(3);
    coords(i,4,1)=tempx(4);
    coords(i,4,2)=tempy(4);
    x=tempx;
    y=tempy;
    toc
    %figure;
    %hold on
    %imagesc(img);
    %plot(x,y);
    %hold off
end


end