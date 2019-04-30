function x=sumaExp(lambda,nreal,n)
close all;
Fx=@(x)-log(x)/lambda;
X=rand(1,nreal);
Sn=Fx(X);
Sx=Sn;
for i=1:n-1
    X=rand(1,nreal);
    Sn=conv(Sn,Fx(X));
end
Z=Sn/sqrt(var(Sx)*n);
as=sprintf('N=%d, Distr: Exp(%f) Realizaciones=%d',n,lambda,nreal);
scatter(linspace(-5*std(Sx),5*std(Sx),length(Z)),Z),title(as)
grid on;
end