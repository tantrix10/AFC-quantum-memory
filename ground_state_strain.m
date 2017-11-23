clear
Edir=[1;1;0];
Edir=Edir/sqrt(Edir'*Edir);
D=2.88; % GHz
BB=linspace(0,120000,1000);
NB=length(BB);
EE=zeros(3,NB);
for j=1:NB
E=BB(j)*Edir;
H=buildHgsS(D,E);
[V,C]=sorted_eig(H);
EE(:,j)=diag(C);
end
%% ***** Graphics *****
figure;
plot(BB,EE,'linewidth',2);
xlabel('Strain (Ghz)');
ylabel('Energy (GHz)');
