function H=buildHgsS(D,E)
muB=13.99624555; % Bohr’s magneton, GHz/Tesla
U=[-1/sqrt(6) -1/sqrt(6) 2/sqrt(6);
1/sqrt(2) -1/sqrt(2) 0 ;
1/sqrt(3) 1/sqrt(3) 1/sqrt(3)];
d=17*(10^(-6));
E=U*E;
Sx=[0 1 0;
1 0 1;
0 1 0]/sqrt(2);
Sy=[0 -1i 0;
1i 0 -1i;
0 1i 0]/sqrt(2);
Sz=diag([1 0 -1]);
%H=(D*(Sz^2))-((0.35*E(3)*(Sz^2 - (3/2)*eye(3)))+((17*10^(-6))*E(1)*(Sy^2 -Sx^2))+((17*10^(-6))*E(2)*(Sx*Sy+Sy*Sx)));
H=[0 0 0; 0 d*E(1) -d*E(2); 0 -d*E(2) -d*E(1)]+D*(Sy^2);
 