function sherlok(n,m,p,k,l)
%n:= Distancia en pasos
%m:= Ensayos
%p:= Probabilidad de la caminata aleatoria
%k:= Número de caminos a graficar
%l:= Largo del puente en pasos
close all;
A=rand(n,m);
%Matriz de caminata aleatoria con probabilidad p a izquierda y 1-p derecha
A=(A>p)-1*(A<=p); 
%Suma acumulada de los pasos
cumA=cumsum(A);
%Vector para graficar
x=[1:1:n];
%Límites del puente
linea=[-l/2,l/2;n,n];
figure(1);
for i=1:1:k
    plot([0;cumA(:,i);cumA(n,i)],[0,x,n+1],'-*')
    hold on;
end
str='Caminata aleatoria. \nPuente de %d pasos de longitud a %d pasos con \n';
str2='p=%.3f \n %d ensayos graficados';
sfr=sprintf(strcat(str,str2),l,n,p,k);
title(sfr),xlabel('Recorrido'),ylabel('Paso número');
axis([-n,n,-1,n+1]);
grid on;
line(linea(1,:),linea(2,:),'Color','black','Marker','*','LineWidth',4)
figure(2)
sfr=sprintf('Histograma de resultados.\n %d pasos de distancia, %d ensayos, p=%.3f',...
    n,m,p);
histogram(cumA(n,:)),title(sfr);
%Probabilidad de caer con p de izquierda y m ensayos a n pasos
prob=((abs(cumA(n,:))>l/2)*(ones(m,1)))/m;
str='Con %d ensayos a una distancia de %d pasos con un puente \n de longitud %d';
str2=' y probabilidad de izquierda p=%.3f se tiene \n una probabilidad de caer de %.5f';
sprintf(strcat(str,str2),m,n,l,p,prob)
end