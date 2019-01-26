clear;
clc;

BW=36e6;
Guard=6.18e6;
inc=BW+Guard;

f0=11200*10^6;
f1=f0+BW/2;
Zone= {'A', 'B' , 'C'};

Down_H_1 = [f1, f1+inc, f1 + 2*inc, f1 + 3*inc  ];
Down_H_2 = [f1 + 4*inc, f1+5*inc, f1 + 6*inc, f1 + 7*inc  ];
Down_H_3 = [f1 + 8*inc, f1+9*inc, f1 + 10*inc, f1 + 11*inc  ];

Down_V_1 = [f1, f1+inc, f1 + 2*inc, f1 + 3*inc  ];
Down_V_2 = [f1 + 4*inc, f1+5*inc, f1 + 6*inc, f1 + 7*inc  ];
Down_V_3 = [f1 + 8*inc, f1+9*inc, f1 + 10*inc, f1 + 11*inc  ];

f1_avg =mean(Down_H_1);
f2_avg =mean(Down_H_2);
f3_avg =mean(Down_H_3);

d_AB = 840;
d_AC = 1670;
d_BC = 1060;

d_AB_min = 540;
d_AC_min = 945;
d_BC_min = 850;

d_AB_max = 1650;
d_AC_max = 2260;
d_BC_max = 2035;

% 
% keySet = {'Li','Jones','Sanchez'};
% testLi = [5.8 7.35];
% testJones = [27 3.92 6.4 8.21];
% testSanchez = 'C:\Tests\Sanchez.dat';
% 
% valueSet = {testLi,testJones,testSanchez};
% M = containers.Map(keySet,valueSet,'UniformValues',false)

Ra=37987e3;
Rb=37470e3;
Rc=36884e3;
c=3e8;
tmp=(Rc*4*pi*f3_avg/c)^2;

FSL= 10*log10(tmp)