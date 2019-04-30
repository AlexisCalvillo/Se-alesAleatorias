function OTApce(lambda,k,pi,pc,ensayos)
close all;
i=1;
OTA=zeros(ensayos,k);
T=OTA(1,:);
OTA(:,i)=1-2*(rand(ensayos,1)<pi);
T(:,i)=-log(rand())/lambda;
for i=i:1:k-1
  T(i+1)=T(i)-log(rand())/lambda;
  OTA(:,i+1)=OTA(:,i)-2*(rand(ensayos,1)<pc).*OTA(:,i);
end
x=randi(ensayos,1,10);
for i=1:1:5
    figure(i)
    a=sprintf('Onda telegráfica con pcambio =%.2f \n y probabilidad de inicio pi=%.2f',...
        pc,pi);
    stairs(T,OTA(x(i),:)),title(a);
    axis([-0.3, max(T)+.5, -1.2,1.2]);
    hold on;
end
x=randi(k,1,10);
for i=1:1:5
    figure(i+5)
     a=sprintf('Histograma pcambio =%.2f \n probabilidad de inicio pi=%.2f \n tiempo t=%2.1f',...
        pc,pi,T(x(i)));
    hist(OTA(:,x(i))),title(a);
    hold on;
end
end