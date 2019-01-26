IBO=-40:5;
OBO= IBO+6-6*exp(IBO/6);
figure(1)
plot(IBO,OBO)

IBO3=-40:-6;

OBO3=IBO3+6-(6.4)*exp((IBO3+6)/6.4);
figure(1)
hold on

plot(IBO3,OBO3)

IBO4=-20:-6;
IM3=3*IBO4+17 - 6.25*exp((IBO4+11.75)/6.25);
figure(1)
hold on
plot(IBO4,IM3)
title("IBO vs OBO");

figure
plot(IBO(21:35),OBO(21:35)-IM3) %(C/N)IM
hold on
plot(IBO(21:35),OBO3(21:35)-IM3)
title("C/N_0)_I_M");
