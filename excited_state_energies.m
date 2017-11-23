clear
%function H=buildHes(lpar, dpar, dper, gpar, gper, Dpar, Dper, lambdapar, lambdaper, B, E, del, MUb)
lpar=0.1;
dpar=0;%0.000006;
dper=0;%0.000006;
gpar=2.01;
gper=2.01;
Dpar=1.42;
Dper=1.52;%1.52/2;
lambdapar=5.3;
lambdaper=0.2;%0.2/sqrt(2);
MUb=13.996;
Bdir=[1;1;1];
E=[0;0;0];
del=[0;0;0];
%these should be normalised
Bdir=Bdir/sqrt(Bdir'*Bdir);
%E=E/sqrt(E'*E);
%del=del/sqrt(del'*del);

BB=linspace(0,5,3000);
NB=length(BB);

EE=zeros(6,NB);

for j=1:NB
    B=BB(j)*Bdir;
    H=buildHes(lpar, dpar, dper, gpar, gper, Dpar, Dper, lambdapar, lambdaper, B, E, del, MUb);
    [V, C]=sorted_eig(H);
    EE(:,j)=diag(C);
end

%plot this
figure;
plot(1000*BB,EE,'linewidth', 2);
xlabel('Magnetic field (mT)');
ylabel('Energy (GHz)');
title(['Magnetic field along [',num2str(Bdir.'),']', ', Electric field along [',num2str(E.'),']']);
    
    
    
    
    