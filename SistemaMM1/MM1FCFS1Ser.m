function MM1FCFS1Ser(n,mi,lambda,x0,x1)
%Simulaci�n de un sistema MM1. FCFS y un servidor

%     n: N�mero de eventos
%    mi: Media del tiempo de servicios 
%lambda: Tasa de llegadas
%x0--x1: Estado del sistema durante los servicios x1-x0
close all;
%Tiempos de llegada
Ti=-log(rand(1,n+1))/lambda;
Ti=cumsum(Ti);
%Tiempos de servicio
Ts=-log(rand(1,n+1))/mi;
Te(1)=0;
Tt(1)=Ts(1)+Ti(1);
i=1;
k=1;
Nt(1,:)=[0,0];
tipoG=1;
while k<n 
    switch tipoG
    case 1
        if (Ti(k)>=Tt(i))
            tipoG=2;
        else
            %Ti(k+1)=Ti(k)-log(rand())/lambda;
            Nt(k+i,:)=[Nt(k+i-1,1)+1,Ti(k)];
            k=k+1;
        end
    case 2
        %Ts(i+1)=-log(rand())/mi;
        tacum=cumsum(Ts);
        Te(i+1)=(Tt(i)-Ti(i+1)).*(Tt(i)-Ti(i+1)>0);
        Tt(i+1)=Ti(i+1)+Te(i+1)+Ts(i+1);
        Nt(k+i,:)=[Nt(k+i-1,1)-((Nt(k+i-1,1))>0),Tt(i)];
        i=i+1;
        tipoG=1;
    end
end

N=Nt(x0:x1,:);
stairs(N(:,1))
for i=1:max(Nt(:,1))+1
    aux1=find(Nt(:,1)==i-1);
    if aux1(length(aux1))==length(Nt(:,1))
        aux1=aux1(1:length(aux1)-1);
   
    end
    aux2=aux1+1;
    tsum=sum(Nt(aux2,2)-Nt(aux1,2));
    P(i)=tsum;
end
P=P/max(Nt(:,2));
figure(2)
subplot(2,1,1)
stem([0:1:max(Nt(:,1))],P,'ok')
subplot(2,1,2)
stem([0:1:max(Nt(:,1))],cumsum(P),'ok')
%Verificaci�n de Little
N=trapz(Nt(1:min([i,k]),2),Nt(1:min([i,k]),1))/max(Nt(1:min([i,k]),2))
T=mean(Te(1:min([i,k-1]))+Ts(1:min([i,k-1])))
abs(N-T./lambda)
P(1)
P(2)