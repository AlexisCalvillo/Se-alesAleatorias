function OTApRx(p,tiempo,lambda,ensayos,subdiv,tini)
close all;
%Matriz OTA y matriz de Tiempos
for j=1:ensayos
    i=1;
    OTA(j,i)=1-2*(rand()<p);
    T(j,i)=-log(rand())/lambda;
    while(T(j,i)<tiempo)
        T(j,i+1)=T(j,i)-log(rand())/lambda;
        OTA(j,i+1)=-OTA(j,i);
        i=i+1;
    end
end
T=[0.*T(:,1) T];
%Matriz de valores
MV=zeros(subdiv,ensayos);
vectorTiempo=linspace(0,tiempo,subdiv);
%vectorIndices=zeros(1,subdiv);
for j=1:ensayos
    %vectorIndices
    ind=find((T(j,:)>tini));
    xo=OTA(j,ind(1)-1);
    %MV(ind(1)-1,j)=xo;
    for i=1:subdiv
        ind=find((T(j,:)>vectorTiempo(i)));
        MV(i,j)=OTA(j,ind(1)-1);
    end
    MV(:,j)=xo.*MV(:,j);
end
%Calcular las medias
Rx=mean(MV');
f=sprintf("Autocorrelación \n lambda=%1.1f \n Probabilidad inicial= %1.1f",lambda,p);
plot(vectorTiempo-tini,(Rx)),title(f),ylabel("Rx(t)"),xlabel("t");
grid on;
end