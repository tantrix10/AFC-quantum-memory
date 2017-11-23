clear


BB=linspace(0,0.5,3000);
NB=length(BB);

EE=zeros(6,NB);

for j=1:NB
    B=BB(j);
    H=[(1.42/3)+1.55+5.3 2.01*13.996*B 0 0 0 0;
    2.01*13.996*B (1.42/3)-1.55+5.3 0 0 0 0;
    0 0 -2*(1.42/3) 0 0 0.2;
    0 0 0 -2*(1.42/3) 0.2*1i 0;
    0 0 0 -0.2*1i (1.42/3)-5.3 -2.01*13.996*B;
    0 0 0.2 0 -2.01*13.996*B (1.42/3)-5.3];
    [V, C]=sorted_eig(H);
    EE(:,j)=diag(C);
end

%plot this
figure;
plot(1000*BB,EE,'linewidth', 2);
xlabel('Magnetic Field (mT)');
ylabel('Energy (GHz)');
%title(['Electric field along [',num2str(Edir.'),']']);