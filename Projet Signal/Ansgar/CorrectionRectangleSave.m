    function [x2,y2] = CorrectionRectangleSave(img,x,y, tours, lambda, Eps)
    [X2,Y2]=GradientEffectif(img);
    
    params=[x,y];
    
    [M1,M2,M3,M4]=formeMatrices(x(1),y(1),x(2),y(2),x(3),y(3),x(4),y(4));
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
    
    for i=1:tours
        %------Correlation avant
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
    
        [X1,Y1]=GradientTheorique(img,params(:,1),params(:,2));
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
        F1=1-(C1+C2+C3+C4)/4;
        %------Correlation après-------
        k=randi(8);
        params2=params;
        params2(k)=params(k)+Eps;
        [X1,Y1]=GradientTheorique(img,params2(:,1),params2(:,2));
    
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
    
    x2=params(:,1);
    y2=params(:,2);
    
    end