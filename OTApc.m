function OTApc(lambda,tiempo,pi,pc)
close all;
i=1;
OTA(i)=1-2*(rand()<pi);
T(i)=-log(rand())/lambda;
while(T(i)<tiempo)
    T(i+1)=T(i)-log(rand())/lambda;
    %Probabilidad de cambio pc, si x<pc cambia al estado opuesto.
    OTA(i+1)=OTA(i)-2*OTA(i)*(rand()<pc)
    i=i+1;
end
stairs(T,OTA)
axis([-.1 max(T)+.1 -1.1 1.1])
clear all;
end