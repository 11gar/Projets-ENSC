rm(list=ls())

n=100;
y=1:n;
for(i in 1:n){
  x1=floor(runif(1,-5,6));
  x2=floor(runif(1,-5,6));
  x3=floor(runif(1,-5,6));
  x4=floor(runif(1,-5,6));
  x5=floor(runif(1,-5,6));
  e=rnorm(1,0,4);
  y[i]=4-2*x1+3*x2-5*x3+0.8*x4+1.4*x5+e;
}
