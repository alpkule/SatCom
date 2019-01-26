
clc
clear
l= (42.5); %enlem
L= 5-7.5; %boylam
R_0=35786e3;
R_E= 6378e3;

e_R = (0.05); %%
e_P = (0.02); %%
e_Y = (0.3); %%

e=5e-4; %%
i=0.03; %%

NS=0.05; %%
EW=0.05; %%


psi = atand( sind(L) / tand(l) );


alfa = atand (R_E * cosd(l)*sind(L)/(R_0 + R_E* (1-cosd(l)*cosd(L))));
Beta = atand ( R_E * sind(l)*cosd(alfa) / ((R_0) + R_E*(1-cosd(l)*cosd(L))));

Beta_prime= atand ( R_E * sind(l) / (R_0 + R_E*(1- cosd(l)*cosd(L) )) );
alfa_prime = atand ( R_E * cosd(l) * sind(L) * cosd(Beta_prime) / ( R_0 + R_E*(1- cosd(l)*cosd(L) ) ) );


%nadir angle
%cos(theta) = cos(alfa)*cos(Beta);


%Depointing along roll axis

Delta_theta_Rx = atand( tand( Beta_prime +e_R )*cosd( alfa ) )- Beta ;
Delta_theta_Ry = ( atand(cosd(Beta)*tand(alfa_prime)) / ( cosd(Beta_prime + e_R) ) ) - alfa_prime ;

Delta_theta_Rx_approximate = e_R*cosd(alfa);
Delta_theta_Ry_approximate = e_R*sind(alfa_prime)*cosd(alfa_prime)*tand(Beta_prime + e_R/2);  % açýlar radyan

%Depointing along pitch axis

Delta_theta_Px = atand( cosd(alfa)*tand(Beta) / (cosd(alfa+e_P) ))- Beta;
Delta_theta_Py =atand ( tand(alfa+e_P)*cosd(Beta_prime )) -alfa_prime;

Delta_theta_Px_approximate = e_P * sind(Beta)*cosd(Beta)*(tand(alfa)+e_P/2);
Delta_theta_Py_approximate = e_P *cosd(Beta_prime);

%Depointing along yaw axis
if (psi ~= 90)
    Delta_theta_Yx = atand( cosd(psi+ e_Y)*tand(Beta) / cosd(psi) )-Beta;
    Delta_theta_Yy = atand( sind(psi+ e_Y)*tand(alfa_prime) / sind(psi) )-alfa_prime;

else
    Delta_theta_Yx = -e_Y*sind(alfa);
    Delta_theta_Yy = e_Y*sind(Beta_prime);
end

Delta_theta_Yx_approximate = Delta_theta_Yx;
Delta_theta_Yy_approximate = Delta_theta_Yy;

Delta_theta_NS_x = -NS * sind(Beta)*cosd(Beta)*cosd(L)/tand(l);
Delta_theta_NS_y = NS*sind(alfa_prime)*cosd(alfa_prime)*tand(Beta_prime);



Delta_theta_i_x = atand( cosd(psi+i ) * tand(Beta) / cosd(psi) ) -Beta;
Delta_theta_i_y = atand(sind(psi+i)*tand(alfa_prime)/sind(psi))- alfa_prime;

Delta_theta_EW_x = atand( tand(Beta) * ( 1 + tand(alfa)*sind(EW))) - Beta;
Delta_theta_EW_y = atand( tand(alfa_prime)*(1-tand(EW)/tand(L))) -alfa_prime;

%Delta_theta_e_x = atand ( ( R_0 + R_E*(1-cosd(l)*cosd(L)*tand(Beta) ) ) / ( R_0 + R_E*(1-cosd(l)*cosd(L)-e*(R_0+R_E))) );

p1=( R_0 + R_E*( 1- cosd(l)*cosd(L) ) * tand(alfa_prime));
p2=( R_0 + R_E*( 1- cosd(l)*cosd(L) ) - e*( R_0 + R_E ) );

%Delta_theta_e_y = atand (  p1 / p2 ) - alfa_prime ;

Delta_theta_e_y = e*(180/pi)* (R_0+R_E)/( R_0+R_E*(1-cosd(l)*cosd(L)) )*sind(alfa_prime)*cosd(alfa_prime);
Delta_theta_e_x= e*(180/pi)* (R_0+R_E)/( R_0+R_E*(1-cosd(l)*cosd(L)) )*sind(Beta)*cosd(Beta);


Delta_theta_SK_x_node = Delta_theta_i_x + Delta_theta_EW_x + Delta_theta_e_x;
Delta_theta_SK_y_node = Delta_theta_i_y + Delta_theta_EW_y + Delta_theta_e_y;

Delta_theta_SK_x_vertex = Delta_theta_NS_x + Delta_theta_EW_x + Delta_theta_e_x;
Delta_theta_SK_y_vertex = Delta_theta_NS_y + Delta_theta_EW_y + Delta_theta_e_y;

Delta_theta_AC_x = sqrt( Delta_theta_Rx^2 + Delta_theta_Px^2 + Delta_theta_Yx_approximate^2);
Delta_theta_AC_y = sqrt( Delta_theta_Ry^2 + Delta_theta_Py^2 + Delta_theta_Yy_approximate^2);

Delta_theta_x_node = Delta_theta_AC_x + Delta_theta_SK_x_node;
Delta_theta_y_node = Delta_theta_AC_y + Delta_theta_SK_y_node;

Delta_theta_x_vertex = Delta_theta_AC_x + Delta_theta_SK_x_vertex;
Delta_theta_y_vertex = Delta_theta_AC_y + Delta_theta_SK_y_vertex;

Delta_theta_m_node=sqrt(Delta_theta_x_node^2+Delta_theta_y_node^2);
Delta_theta_m_vertex=sqrt(Delta_theta_x_vertex^2+Delta_theta_y_vertex^2);

max(Delta_theta_m_node,Delta_theta_m_vertex)
