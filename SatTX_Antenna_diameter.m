f=[11200e6, 11700e6];
c=3*10e8;
lambda=[2.67 2.56];

Delta_Theta_m=[0.067, 0.065 0.061];
D1 = min(  70*lambda(1)./(2*(Delta_Theta_m+0.025) +0.75) );
D2 = min(  70*lambda(2)./(2*(Delta_Theta_m+0.025) +0.75) );

D=min(D1,D2)/100

k_D = P01_sat /10 * (0.5*D/(4*R))^2