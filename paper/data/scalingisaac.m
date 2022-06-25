% from Table 8.1 in issac et al 2015
its = [7*66 10*75 11*90]
polyfit(log([1 8 64]),log(its),1)
%ans = 0.18326   6.17004
polyfit(log([7e6 51e6 383e6]),log(its),1)
%ans = 0.19030   3.17188