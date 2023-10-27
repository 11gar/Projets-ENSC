function [M1,M2,M3,M4] = formeMatrices(x1,y1,x2,y2,x3,y3,x4,y4)
M1=formeMatrice(x1,y1,x2,y2);
M2=formeMatrice(x2,y2,x3,y3);
M3=formeMatrice(x3,y3,x4,y4);
M4=formeMatrice(x4,y4,x1,y1);