function H=buildHgs(D,g,B)
muB=13.99624555; % Bohr’s magneton, GHz/Tesla
U=[-1/sqrt(6) -1/sqrt(6) 2/sqrt(6);
1/sqrt(2) -1/sqrt(2) 0 ;
1/sqrt(3) 1/sqrt(3) 1/sqrt(3)];
B=U*B;
Sx=[0 1 0;
1 0 1;
0 1 0]/sqrt(2);
Sy=[0 -1i 0;
1i 0 -1i;
0 1i 0]/sqrt(2);
Sz=diag([1 0 -1]);
H=D*Sz^2-muB*g*(B(1)*Sx+B(2)*Sy+B(3)*Sz);