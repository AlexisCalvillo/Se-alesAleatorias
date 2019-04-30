function x=sumaUnifDisc(a,b,points,n)
close all;
Sx=linspace(a,b,points);
Fx=@(x)1/points*x./x;
Sn=Fx(Sx);
for i=1:n-1
    Sn=conv(Sn,Fx(Sx));
end
Z=Sn/sqrt(var(Sx)*n);
as=sprintf('N=%d, Distr: Unif Discreta. a=%d, b=%d, puntos=%d',n,a,b,points);
scatter(linspace(-5*std(Sx),5*std(Sx),length(Z)),Z),title(as)
grid on;
end