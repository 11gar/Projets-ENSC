function [x2,y2] = CorrectionRectangle(img,x,y, tours, lambda, Eps)

[X2,Y2]=GradientEffectif(img);
params=[x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4)];

[M1,M2,M3,M4]=formeMatrices(x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4));
M=cat(4,M1,M2, M3, M4);


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
    
    CoteInteret=[Cote1InteretX
                Cote1InteretY
                Cote2InteretX
                Cote2InteretY
                Cote3InteretX
                Cote3InteretY
                Cote4InteretX
                Cote4InteretY];

    CoteInteretTh=[Cote1InteretXTh
                    Cote1InteretYTh
                    Cote2InteretXTh 
                    Cote2InteretYTh
                    Cote3InteretXTh
                    Cote3InteretYTh
                    Cote4InteretXTh
                    Cote4InteretYTh];

for i=1:tours
    disp("-------");
    %------Correlation avant
    [X1,Y1]=GradientTheorique(img,[params(1),params(3),params(5),params(7)],[params(2),params(4),params(6),params(8)]);
    k=randi(8);
    ki=k;
    if(mod(ki,2)==0)
        ki=k-1;
    end
    i1=ki-2;
    i2=ki-1;
    i3=ki;
    i4=ki+1;
    if(i1<=0)
        i1=i1+8;
    end
    if(i2<=0)
        i2=i2+8;
    end
    if(i3>8)
        i3=i3-8;
    end
    if(i4>8)
        i4=i4-8;
    end

    for x=1:15
        for y=1:101
        CoteInteret(i1,x,y)=X2(M(x,y,2,ceil(i1/2)),M(x,y,1,ceil(i1/2)));
        CoteInteret(i2,x,y)=Y2(M(x,y,2,ceil(i2/2)),M(x,y,1,ceil(i2/2)));
        CoteInteret(i3,x,y)=X2(M(x,y,2,ceil(i3/2)),M(x,y,1,ceil(i3/2)));
        CoteInteret(i4,x,y)=Y2(M(x,y,2,ceil(i4/2)),M(x,y,1,ceil(i4/2)));
        end
    end
    for x=1:15
        for y=1:101
        CoteInteretTh(i1,x,y)=X1(M(x,y,2,ceil(i1/2)),M(x,y,1,ceil(i1/2)));
        CoteInteretTh(i2,x,y)=Y1(M(x,y,2,ceil(i2/2)),M(x,y,1,ceil(i2/2)));
        CoteInteretTh(i3,x,y)=X1(M(x,y,2,ceil(i3/2)),M(x,y,1,ceil(i3/2)));
        CoteInteretTh(i4,x,y)=Y1(M(x,y,2,ceil(i4/2)),M(x,y,1,ceil(i4/2)));
        end
    end
    C1=gradient_correlation(CoteInteret(1),CoteInteret(2),CoteInteretTh(1),CoteInteretTh(2));
    C2=gradient_correlation(CoteInteret(3),CoteInteret(4),CoteInteretTh(3),CoteInteretTh(4));
    C3=gradient_correlation(CoteInteret(5),CoteInteret(6),CoteInteretTh(5),CoteInteretTh(6));
    C4=gradient_correlation(CoteInteret(7),CoteInteret(8),CoteInteretTh(7),CoteInteretTh(8));
    F1=1-(C1+C2+C3+C4)/4;
    %------Correlation après-------
    
    params2=params;
    params2(k)=params(k)+Eps;
    [X1,Y1]=GradientTheorique(img,[params2(1),params2(3),params2(5),params2(7)],[params2(2),params2(4),params2(6),params2(8)]);

    for x=1:15
        for y=1:101
        CoteInteretTh(i1,x,y)=X1(M(x,y,2,ceil(i1/2)),M(x,y,1,ceil(i1/2)));
        CoteInteretTh(i2,x,y)=Y1(M(x,y,2,ceil(i2/2)),M(x,y,1,ceil(i2/2)));
        CoteInteretTh(i3,x,y)=X1(M(x,y,2,ceil(i3/2)),M(x,y,1,ceil(i3/2)));
        CoteInteretTh(i4,x,y)=Y1(M(x,y,2,ceil(i4/2)),M(x,y,1,ceil(i4/2)));
        end
    end
    C1=gradient_correlation(CoteInteret(1),CoteInteret(2),CoteInteretTh(1),CoteInteretTh(2));
    C2=gradient_correlation(CoteInteret(3),CoteInteret(4),CoteInteretTh(3),CoteInteretTh(4));
    C3=gradient_correlation(CoteInteret(5),CoteInteret(6),CoteInteretTh(5),CoteInteretTh(6));
    C4=gradient_correlation(CoteInteret(7),CoteInteret(8),CoteInteretTh(7),CoteInteretTh(8));
    F2=1-(C1+C2+C3+C4)/4;
    params(k)=round(params(k)+lambda*(F2-F1)/Eps);
end

x2=[params(1),params(3),params(5),params(7)];
y2=[params(2),params(4),params(6),params(8)];


end