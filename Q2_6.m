clear;
clc;

D=1.91;

P01_sat =50;
k=1.38064852e-23;
B=10.8e6;

R_0=35786e3;
R_E= 6378e3;

R=R_0+R_E;

Ra=sqrt((R-R_E*cosd(3)*cosd(49))^2+(R_E*sind(3)*cosd(49))^2+(R_E*sind(3))^2);
Rb=sqrt((R-R_E*cosd(3)*cosd(42.5))^2+(R_E*sind(3)*cosd(42.5))^2+(R_E*sind(3))^2)
Rc=sqrt((R-R_E*cosd(2.5)*cosd(34))^2+(R_E*sind(3)*cosd(34))^2+(R_E*sind(2.5))^2)


k_D=[]
k_D=[k_D; 10*log10( P01_sat * (0.5*D)^2 / ( k*B*10^(1/10) *(4*Ra)^2  ) )]; 
k_D=[k_D; 10*log10( P01_sat * (0.5*D)^2 / ( k*B*10^(1/10) *(4*Rb)^2  ) ) ];
k_D=[k_D; 10*log10( P01_sat * (0.5*D)^2 / ( k*B*10^(1/10) *(4*Rc)^2  ) ) ];
