
load("DONNEES/appartements.Rda");
prix=appartements$prix;
surf=appartements$surface;

plot(appartements$surface,appartements$prix)

res<-lm(formula= prix~surf)
summary(res)

#BACTERIES
load("DONNEES/bacteries.Rda")
t=bacteries$t;
nt=bacteries$nt;
plot(t,nt)

reg<-lm(t~nt)
summary(reg)

#EXO FIN

beta0=3;
beta1=2
sigma=1
vect.n=seq(from=100, to=1000,by=100)
N=1000
mat.b0=matrix(NA,ncol=length(vect.n),nrow=N);
for(k in 1:length(vect.n)){
  for(j in 1:N){
    x=runif(vect.n[k],min=0,max=5)
    e=rnorm(vect.n[k], mean=0, sd=sigma)
    y=beta0+beta1*x+e
    res=lm(y~x)
    mat.b0[j,k]=coef(res)[1]
  }
}
boxplot(mat.b0,names=paste("n=",vect.n,sep=""))
abline(h=beta0,col=2,lwd=3)
