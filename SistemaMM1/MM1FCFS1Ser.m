function MM1FCFS1Ser(n,mi,lambda,x0,x1)
%Simulación de un sistema MM1. FCFS y un servidor

%     n: Número de eventos
%    mi: Media del tiempo de servicios 
%lambda: Tasa de llegadas
%x0--x1: Estado del sistema durante los servicios x1-x0

%k al número de llegada
k=1;
close all;

%tipoG determina si se generan tiempos de salida o de llegada
tipoG=1;
Ts=zeros(1,n);
Ti(1)=-log(rand())/lambda;
Ts(1)=-log(rand())/mi;
Te(1)=0;
Nt(1,:)=[0,0];
i=1;
while i<n
switch tipoG
    case 1
        if Ti(k)>=Ts(i)+Ti(i)
            tipoG=2;
        else
            Ti(k+1)=Ti(k)-log(rand())/lambda;
            Nt(k+i,:)=[Nt(k+i-1,1)+1,Ti(k+1)];
            k=k+1;
        end
    case 2
        Ts(i+1)=-log(rand())/mi;
        tacum=cumsum(Ts);
        Te(i+1)=(tacum(i)-Ti(i))*(tacum(i)-Ti(i)>0);
        Nt(k+i,:)=[Nt(k+i-1,1)-1,Te(i+1)+Ti(i+1)];
        i=i+1;
        tipoG=1;
end
end
A=[Ti(1:n);Te+Ti(1:n);Ts;Te;Te+Ts]';
P=Nt(x0:x1,:)
stairs(P(:,1))
end