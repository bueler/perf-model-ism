% generate serial scaling for bueler 2016
% LU solve of Newton step equations
% see sia-fve/petsc/verif/domeperf.sh
% see generated file bueler.perf

n = [18 36 72 144 288].^2;
flops = [1.776e7 1.749e8 2.374e9 2.608e10 2.927e11]
polyfit(log(n),log(flops),1)
%ans = 1.76186   6.45957
