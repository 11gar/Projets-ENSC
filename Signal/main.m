clear all;

blocs1all=[];
blocs2all=[];

for i=1:20
data=getDataFromSubject(i);
GrapheElectrode(16,data)
end

% 
% for i=1:20
% [blocs1,blocs2]=getDataFromSubject(i);
% blocs1all(i,:,:)=blocs1;
% blocs2all(i,:,:)=blocs2;
% end
% 
% % Chargement des données
% for i = 2:17
%    figure(i);
%    plot(mean(blocs1));
%    hold on
%    plot(mean(blocs2));
%    hold off
%    axis([80 120 0 50]);
% end


