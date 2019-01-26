IBO=-40:5;
OBO= IBO+6-6*exp(IBO/6);
figure(1)
plot(IBO,OBO)

IBO3=-40:-6;

OBO3=IBO3+6-(6.4)*exp((IBO3+6)/6.4);
figure(1)
hold on

plot(IBO3,OBO3)

IBO_limited=-20:-6;
IM3=3*IBO_limited+17 - 6.25*exp((IBO_limited+11.75)/6.25);
figure(1)
hold on
plot(IBO_limited,IM3)
title("IBO vs OBO");
xlabel("IBO");
ylabel("OBO");
legend("OBO = P_o^1/(P_o^1)_s_a_t" , "OBO = P_o^3/(P_o^1)_s_a_t","IM = P_o^I^M/(P_o^1)_s_a_t " );

figure
plot(IBO(21:35),OBO(21:35)-IM3) %(C/N)IM
hold on
plot(IBO(21:35),OBO3(21:35)-IM3)
title("(C/N_0)_I_M");
legend("C/N_(I_M_3_1)","C/N_I_M_3_2");

CN_IM=OBO(21:35)-IM3;
CN_IM2=OBO3(21:35)-IM3;


kU=32.62;
kD=10.47;

CN_U=IBO+kU;
figure();
plot(IBO, CN_U);
legend("C/N_U");

IBOi=IBO(21:35);
OBO3i=OBO(21:35);

GT_es =[12 15 20 25 30 35];
%GT_es =[35:5:60];


CN_D = kD+OBO3i+GT_es';
hold on 
plot(IBOi,CN_D)
legend("C/N_U", "G/T_e_s = 12", "G/T_e_s = 15", "G/T_e_s = 20", "G/T_e_s = 25", "G/T_e_s = 30", "G/T_e_s = 35" );
title("C/N_D");
xlim([-25 0]);

CN_Di=10.^(-1*CN_D/10);
CN_Ui=10.^(-1*CN_U(21:35)/10);
CN_IMi= 10.^(-1*CN_IM/10);
CN_IM2i=10.^(-1*CN_IM2/10);


CN_I_ES = 35;
CN_I_SAT =25;

CN_I_ES_i= (10^(-1*CN_I_SAT/10));
CN_I_SAT_i = (10^(-1*CN_I_SAT/10));
CN_Ii = CN_I_SAT_i + CN_I_ES_i;

x=-20:-6;

figure()
subplot(1,2,1)
plot((-20:-6), 10*log10(1./(CN_Di(1,:)+CN_Ui+CN_IMi+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(2,:)+CN_Ui+CN_IMi+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(3,:)+CN_Ui+CN_IMi+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(4,:)+CN_Ui+CN_IMi+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(5,:)+CN_Ui+CN_IMi+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(6,:)+CN_Ui+CN_IMi+CN_Ii)));

title("C/N_T_o_t_a_l");
legend("G/T_e_s = 12", "G/T_e_s = 15", "G/T_e_s = 20", "G/T_e_s = 25", "G/T_e_s = 30", "G/T_e_s = 35");
xlabel("IBO");
ylabel("C/N_T_o_t_a_l");


subplot(1,2,2);
plot((-20:-6), 10*log10(1./(CN_Di(1,:)+CN_Ui+CN_IM2i+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(2,:)+CN_Ui+CN_IM2i+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(3,:)+CN_Ui+CN_IM2i+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(4,:)+CN_Ui+CN_IM2i+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(5,:)+CN_Ui+CN_IM2i+CN_Ii)));
hold on
plot((-20:-6), 10*log10(1./(CN_Di(6,:)+CN_Ui+CN_IM2i+CN_Ii)));

title("C/N_T_o_t_a_l for OBO3");
legend("G/T_e_s = 12", "G/T_e_s = 15", "G/T_e_s = 20", "G/T_e_s = 25", "G/T_e_s = 30", "G/T_e_s = 35");
xlabel("IBO");
ylabel("C/N_T_o_t_a_l");


