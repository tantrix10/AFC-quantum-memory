clear


BB=linspace(0,12,3000);
NB=length(BB);

EE=zeros(6,NB);

delt=[1;1];

for j=1:NB
    B=0;
    delta=BB(j)*(sqrt((delt(1)^2)+(delt(2)^2)));
    H=[(1.42/3)+1.55+5.3 2.01*13.996*B 0 0 delta -1i*delta;
    2.01*13.996*B (1.42/3)-1.55+5.3 0 0 -1i*delta delta;
    0 0 -2*(1.42/3)+delta delta 0 0.2;
    0 0 delta -2*(1.42/3)-delta 0.2*1i 0;
    delta 1i*delta 0 -0.2*1i (1.42/3)-5.3 -2.01*13.996*B;
    1i*delta delta 0.2 0 -2.01*13.996*B (1.42/3)-5.3];
    [V, C]=sorted_eig(H);
    EE(:,j)=diag(C);
end

%plot this
figure;
plot(BB,EE,'linewidth', 2);
xlabel('Electric field/Strain (Ghz)');
ylabel('Energy (GHz)');
%title(['Electric field along [',num2str(Edir.'),']']);