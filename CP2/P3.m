% Setup B params and ICs
% m1 = 2 . 2 5 ; m2 = 2 . 5 ; m3 = 2 . 5 ;
% a = 0 . 4 ; sigma = 1 . 1 ; K = 1 ; alpha = 1 . 2 ;
% t0 = 0 ; t f = 500;
% x10 = 0 . 0 0 1 ; x20 = 0 . 0 0 2 ; x30 = 0 . 1 ; y0 = 0 . 1 ;

% --- P3a Base line Sol ---
h = 0.01;
Method = 'RK4';
t0 = 0 ; tf = 1000;
w0 = [0.001; 0.002; 0.1; 0.1];
Pars.m1 = 2.25; Pars.m2 = 2.5; Pars.m3 = 2.5;
Pars.a = 0.4; Pars. sigma = 1.1; Pars.K = 1; Pars.alpha = 1.2;

[Tref,Wref] = ODEsolver (t0,w0,tf,h,'BAR',Method,Pars);
Yref = Wref(4,:);

% Baseline solution plot for clarity and explanation
figure(1)
plot(Tref,Wref,'linewidth',1)
title('RK4 Baseline Solution Plot', 'FontSize', 18)
xlabel('Time','FontSize',18)
ylabel('Population','FontSize',18)
legend ('Prey x1','Prey x2','Prey x3','Predator y','FontSize',18)

% --- P3b Error Calc ---
H = [0.05; 0.1; 0.2; 0.4; 0.6; 0.8];
E1 = [ ];
Method = 'Euler ';
for i =1:6
[T,W] = ODEsolver(t0 ,w0, tf, H(i), 'BAR', Method, Pars);
Emax = ErrorCalc(Tref ,Wref , T, W);
E1(i) = Emax;
end

figure(2)
y = E1;
yyaxis left
plot(H,E1,'linewidth',1)
ylabel('Euler Error', 'FontSize', 18)
hold on;
E2 = [ ];
Method = 'RK4';

for i =1:6
[T,W] = ODEsolver(t0 ,w0, tf, H(i), 'BAR', Method, Pars);
Emax = ErrorCalc(Tref , Wref, T, W);
E2(i) = Emax;
end

y = E2;
yyaxis right
plot(H,E2,'linewidth',1)
title('Error of Method vs Stepsize', 'FontSize', 18)
xlabel('Stepsize, h', 'FontSize', 18)
ylabel('RK4 Error', 'FontSize', 18)
legend('Euler', 'RK4', 'FontSize', 18)
hold off;

% --- P3c Log error graphs ---
logH = log(H);
logE1 = log(E1);
logE2 = log(E2);

figure(3)
plot(logH, logE1, 'linewidth', 1)
hold on;
plot(logH, logE2, 'linewidth', 1)
title('Log Error of Method vs Log Stepsize', 'FontSize', 18)
xlabel('Log Stepsize', 'FontSize', 18)
ylabel('Log Error', 'FontSize', 18)
legend('Euler', 'RK4', 'FontSize', 18)

fig = gcf; fig.PaperPositionMode = 'auto'; figpos = fig.PaperPosition;
fig.PaperSize = [figpos(3) figpos(4)];
