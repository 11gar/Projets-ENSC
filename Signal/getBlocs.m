function [blocsFftOuverts,blocsFftFermes] = getBlocs(index,data)
timestamp1=find(data(:,18)>0);
timestamp2=find(data(:,19)>0);

blocsFermes=zeros(length(timestamp1),5121);
blocsOuverts=zeros(length(timestamp1),5121);
disp("---------");
for i=1:length(timestamp1)
    blocsFermes(i,:)=data(timestamp1(i):timestamp1(i)+5120,index);
    blocsOuverts(i,:)=data(timestamp2(i):timestamp2(i)+5120,index);
end

%Normalisation

blocsFftOuverts=[];
blocsFftFermes=[];

for i=1:length(timestamp1)
    blocsFermes(i,:)=(blocsFermes(i,:)-min(blocsFermes(i,:)))/(max(blocsFermes(i,:)-min(blocsFermes(i,:))));
    blocsOuverts(i,:)=(blocsOuverts(i,:)-min(blocsOuverts(i,:)))/(max(blocsOuverts(i,:)-min(blocsOuverts(i,:))));

    blocsFftOuverts(i,:)=abs(fft(blocsOuverts(i,:),5120));
    blocsFftFermes(i,:)=abs(fft(blocsFermes(i,:),5120));
    
end

end