% Setup A params and ICs
% m1 = 2 ; m2 = 2 ; m3 = 2 ;
% a= 0 . 3 ; sigma = 1 . 1 ; K = 1 ; alpha = 2 ;
% t0 = 0 ; t f = 500;
% x10 = 0 . 1 ; x20 = 0 . 0 2 ; x30 = 0 . 0 1 ; y0 = 0 . 0 1 ;

% --- P1a Euler --- %
h = 0.1;
Method = 'Euler';
t0 = 0; tf = 500;
w0 = [0.1; 0.02; 0.01; 0.01];
Pars.m1 = 2; Pars.m2 = 2; Pars.m3 = 2;
Pars.a = 0.3; Pars.sigma = 1.1; Pars.K = 1; Pars.alpha = 2;
[T,W] = ODEsolver(t0,w0,tf,h,'BAR',Method,Pars);
figure(1)
plot(T,W,'linewidth',1)
title('Populations of Predator and Prey Species vs Time', 'FontSize', 20)
xlabel('Time', 'FontSize', 20)
ylabel('Population', 'FontSize', 20)
legend('Prey x1', 'Prey x2', 'Prey x3', 'Predator y', 'FontSize', 20)

% --- P1b Pred vs Prey pop --- %
y = W(4,:);
x = W(1,:)+W(2,:)+W(3,:);
figure(2)
plot(y,x,'linewidth',1)
title('Predator Population vs Total Prey Population','FontSize', 20)
ylabel('Prey population', 'FontSize', 20)
xlabel('Predator Population','FontSize', 20)

fig = gcf; fig.PaperPositionMode = 'auto'; figpos = fig.PaperPosition;
fig.PaperSize = [figpos(3) figpos(4)];