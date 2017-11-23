Bdir=[1;1;1];
Bdir=Bdir/sqrt(Bdir'*Bdir);
D=2.88; % GHz
g=2.003;
BB=linspace(0,0.0001,100);
NB=length(BB);
EE=zeros(3,NB);
for j=1:NB
B=BB(j)*Bdir;
H=buildHgs(D,g,B);
[V,E]=sorted_eig(H);
EE(:,j)=diag(E);
end
%% ***** Graphics *****
figure;
plot(1000*BB,EE,'linewidth',2);
xlabel('Magnetic field (mT)');
ylabel('Energy (GHz)');
title(['Magnetic field along [',num2str(Bdir.'),']']);