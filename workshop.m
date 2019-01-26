o=50/9.8/290;
pint=1090;
pf=o+log(pint);
res=[];

for i=1:15
    pf=o+log(pint)
    res=[res;i,pf,exp(pf)];
    pint=exp(pf);
    
end


DV=50;
g0=9.8;
Isp=315;
Minit = exp ( DV/g0/Isp + log(res(15,3)) )

mp=Minit*(exp(DV/g0/Isp)-1);
mp2=Minit*(1-exp(-DV/g0/Isp));

mu = 3.986e14;
Re= 6378e3;
hp=500e3;
ha=35786e3
a= (hp+ha)/2 + Re;

Vp =sqrt ( 2*mu/(Re+hp) - (mu/a) );


Va=sqrt ( 2*mu/(Re+ha) - (mu/a) );

K=(Re+hp)/(Re+ha);
k=K
DeltaV=( mu*K / (Re+hp) * (1 + 2*k/(K+1)) - 2*sqrt ()  )

