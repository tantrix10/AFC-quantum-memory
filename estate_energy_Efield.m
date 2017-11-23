clear
%function H=buildHes(lpar, dpar, dper, gpar, gper, Dpar, Dper, lambdapar, lambdaper, B, E, del, MUb)
lpar=0.1;
dpar=0.000006;
dper=0.000006;
gpar=2.01;
gper=2.01;
Dpar=1.42;
Dper=1.52/2;
lambdapar=5.3;
lambdaper=0.2/sqrt(2);
MUb=13.996;
B=[0;0;0];
Edir=[1;1;1];
del=[0;0;0];
%these should be normalised
%Bdir=Bdir/sqrt(Bdir'*Bdir);
Edir=Edir/sqrt(Edir'*Edir);
%del=del/sqrt(del'*del);

BB=linspace(0,2,3000);
NB=length(BB);

EE=zeros(6,NB);

for j=1:NB
    E=BB(j)*Edir;
    H=buildHes(lpar, dpar, dper, gpar, gper, Dpar, Dper, lambdapar, lambdaper, B, E, del, MUb);
    [V, C]=sorted_eig(H);
    EE(:,j)=diag(C);
end

%plot this
figure;
plot(BB,EE,'linewidth',2);
xlabel('Electric field (??)');
ylabel('Energy (GHz)');
title(['Electric field along [',num2str(Edir.'),']']);
    
    
    