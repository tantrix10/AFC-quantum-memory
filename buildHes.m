function H=buildHes(lpar, dpar, dper, gpar, gper, Dpar, Dper, lambdapar, lambdaper, B, E, del, MUb)
%https://arxiv.org/pdf/1302.3288.pdf
% Dpar=1.42, Dper=1.55/2 are spin-spin interactions. lambdapar=5.3,
% lambdaper=0.2/sqrt(2), this is essentiall the axial spin-orbit
% interaction, though there is some contention on its precise origins. 

%n.b. of the next interaction, as far as I'm aware only lpar has been
%directly observed, although we have estimates for other values

%lpar=0.1+-0.01 is the 3E orbital magnetic moment. 
%gpar, gper, (2.01+-0.01, this however is at room temp and the low temp
%values are expected to be different) are the components of the 3E 
%electronic g-factor tensor (I
%dpar, dper, (order of 6kHz m/V, the experiment that found this did not
% know the direction of their E-field so individual components are not 
%known) are the components of the 3E electric dipole moment.

%The interaction parameters are left in as variables as there is variance
%in their values in the literature


%this is a function to build the hamiltonian from given inputs for electric
%field, magnetic field and strain.

%MUb, Bhor's magneton

U=[-1/sqrt(6) -1/sqrt(6) 2/sqrt(6);
1/sqrt(2) -1/sqrt(2) 0 ;
1/sqrt(3) 1/sqrt(3) 1/sqrt(3)]; 

%transformation maxtrix from crystal coordinates to NV coordinates. This is
%the transformation of the [111] defect
%magnetic field transformed B'=U*B

%B, E, del, magnetic, electric and strain fields respectively, wrt crystal
%basis of form (B_[100], B_[010], B_[001])


Sx=[0 1 0;
    1 0 1;
    0 1 0]/sqrt(2);


Sy=[0 -1i 0;
    1i 0 -1i;
    0 1i 0]/sqrt(2);

Sz=diag([1 0 -1]);

sigx=[0 1;
      1 0];
  
sigy=[0 -1i;
      1i 0];

sigz=[1 0;
      0 -1];


B=U*B;
E=U*E;
del=U*del;

H=(dpar*(E(3)+del(3))*eye(6))+(dper*(E(1)+del(1))*kron(sigz, eye(3)))-(dper*(E(2)+del(2))*kron(sigx, eye(3)))+(MUb*B(3)*((lpar*(kron(sigy, eye(3))))))+(gpar*kron(eye(2), Sz))+(MUb*gper*((kron(eye(2), Sx)*B(1))))+(kron(eye(2), Sy)*B(2))+(Dpar*(kron(eye(2), (Sz)^2)-((2/3)*eye(6))))-(lambdapar*kron(sigy, Sz))+(Dper*(kron(sigz, ((Sy)^2)-((Sx)^2))))-(Dper*kron(sigx, ((Sy*Sx)+(Sx*Sy))))+(lambdaper*(kron(sigz, ((Sx*Sz)+(Sz*Sx)))))-(lambdaper*(kron(sigx, ((Sy*Sz)+(Sz*Sy)))));

    