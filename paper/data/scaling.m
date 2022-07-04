% generate serial scaling for bueler 2016 and isaac et al 2015 and tumarino et al 2016

% note on iterations: if iterations scale as O(m^alpha) then flops scale as O(m^{1+alpha}); this is under assumption that each iteration costs O(m) flops

% bueler:  LU solve of Newton step equations for dome; see sia-fve/petsc/verif/domeperf.sh; see generated file bueler.perf
% isaac: AMG-Krylov-Newton Stokes solve for antarctica; see table 8.1 in paper
% tumarino: MDSC–AMG-Krylov-Newton higher-order solve for greenland; see table 7.5 in paper; area of Greenland taken from Searise data: 300x560 5km grid

nb = [18 36 72 144 288].^2;
flopsb = [1.776e7 1.749e8 2.374e9 2.608e10 2.927e11];
pb = polyfit(log(nb),log(flopsb),1);
%ans = 1.76186   6.45957   ==>  beta = 0.76186

ni = [7e6 51e6 383e6];
itsi = [7*66 10*75 11*90]; % total Krylov iterations over Newton steps
pi = polyfit(log(ni),log(itsi),1);
%ans = 0.19030   3.17188   ==>  alpha = 0.19030

nt = ((300*560*5^2) / (8^2)) * [1 4 16 64 256];
itst = [36*13.3 34*12.7 35*12.3 36*13.3 37*17.4]; % total Krylov iterations over Newton steps
pt = polyfit(log(nt),log(itst),1);
%ans = 0.05017   5.49297   ==>  alpha = 0.05017

subplot(3,1,1)
loglog(nb, flopsb, 'bo')
xlabel('degrees of freedom m')
ylabel('flops')
title('Bueler')
hold on
loglog(nb, exp(pb(1) * log(nb) + pb(2)), 'b--')
hold off
legend(sprintf('O(m^{%.3d})',pb(1)))

subplot(3,1,2)
loglog(ni, itsi, 'ro')
xlabel('degrees of freedom m')
ylabel('total krylov iterations')
title('Isaac')
hold on
loglog(ni, exp(pi(1) * log(ni) + pi(2)), 'r--')
hold off
legend(sprintf('O(m^{%.3d})',pi(1)))

subplot(3,1,3)
loglog(nt, itst, 'go')
xlabel('degrees of freedom m')
ylabel('total krylov iterations')
title('Tumarino')
hold on
loglog(nt, exp(pt(1) * log(nt) + pt(2)), 'g--')
hold off
legend(sprintf('O(m^{%.3d})',pt(1)))
