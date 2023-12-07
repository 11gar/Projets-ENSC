function data = getDataFromSubject(index)

if(index<10)
    path=strcat("Data/subject_0",int2str(index),".mat");
else
    path=strcat("Data/subject_",int2str(index),".mat");
end
data=load(path);

data=data.SIGNAL;
end

