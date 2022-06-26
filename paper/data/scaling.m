% generate serial scaling for bueler 2016 and isaac et al 2015
% bueler:  LU solve of Newton step equations; see sia-fve/petsc/verif/domeperf.sh; see generated file bueler.perf
% isaac: AMG-Krylov-Newton Stokes solve; see table 8.1 in paper

nb = [18 36 72 144 288].^2;
flopsb = [1.776e7 1.749e8 2.374e9 2.608e10 2.927e11];
pb = polyfit(log(nb),log(flopsb),1);
%ans = 1.76186   6.45957

ni = [7e6 51e6 383e6];
itsi = [7*66 10*75 11*90];
%polyfit(log([1 8 64]),log(its),1) --> ans = 0.18326   6.17004
pi = polyfit(log(ni),log(itsi),1);
%ans = 0.19030   3.17188

subplot(2,1,1)
loglog(nb, flopsb, 'bo')
xlabel('degrees of freedom')
ylabel('flops')
title('bueler')
hold on
loglog(nb, exp(pb(1) * log(nb) + pb(2)), 'b--')
hold off
legend(sprintf('O(n^{%.2d})',pb(1)))

subplot(2,1,2)
loglog(ni, itsi, 'ro')
xlabel('degrees of freedom')
ylabel('krylov iterations')
title('isaac')
hold on
loglog(ni, exp(pi(1) * log(ni) + pi(2)), 'r--')
hold off
legend(sprintf('O(n^{%.2d})',pi(1)))
