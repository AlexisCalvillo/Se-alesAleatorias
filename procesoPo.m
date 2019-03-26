function procesoPo (lambda, tiempo)
close all;      
i=1;
T(i)=-log(rand())/lambda;
while T(i) < tiempo
    T(i+1)=T(i)+-log(rand())/lambda;
    i=i+1;
end
sf=sprintf("Proceso Poisson \n lamda = %2.3f , tiempo =%2.3f",lambda,tiempo);
figure(1);
stairs([0,T],[0:1:i]);
title(sf);
xlabel("Tiempo (seg), llegadas exponenciales");
ylabel("Número de llegadas");
figure(2);
sf=sprintf("Llegadas exponenciales \n lamda = %2.3f",lambda);
plot(T,zeros(1,i),'*k'), title(sf);
xlabel("Tiempo (seg)");
axis([-.5 max(T)+.5 -.2 .2 ]);
end