function OTAp(lambda,tiempo,p)
close all;
i=1;
OTA(i)=1-2*(rand()<p);
T(i)=-log(rand())/lambda;
while(T(i)<tiempo)
    T(i+1)=T(i)-log(rand())/lambda;
    OTA(i+1)=-OTA(i)
    i=i+1;
end
stairs(T,OTA)
axis([-.1 max(T)+.1 -1.1 1.1])
clear all;
end