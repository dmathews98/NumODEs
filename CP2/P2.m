% Setup B params and ICs
% m1 = 2 . 2 5 ; m2 = 2 . 5 ; m3 = 2 . 5 ;
% a = 0 . 4 ; sigma = 1 . 1 ; K = 1 ; alpha = 1 . 2 ;
% t0 = 0 ; t f = 500;
% x10 = 0 . 0 0 1 ; x20 = 0 . 0 0 2 ; x30 = 0 . 1 ; y0 = 0 . 1 ;

% --- P2a Euler Subplots ---
H1 = [0.05; 0.1; 0.2; 0.4];

Method = 'Euler';
t0 = 0; tf = 500;
w0 = [0.001; 0.002; 0.1; 0.1];
Pars.m1 = 2.25; Pars.m2 = 2.5; Pars.m3 = 2.5;
Pars.a = 0.4; Pars.sigma = 1.1; Pars.K = 1; Pars.alpha = 1.2;

for i =1:4
[T1 ,W1] = ODEsolver(t0,w0,tf,H1(i),'BAR',Method,Pars);
figure(1)
subplot(1,4,i);
x = W1(1,:) + W1(2,:) + W1(3,:); y = W1(4,:);
plot(y,x,'linewidth',1);
title(['h='num2str(H1(i))]); axis([0 0.5 0 1]);
sgtitle('Predator vs Prey Population for Varying Stepsize by Euler','FontSize',16)
xlabel('Pred. Pop.')
ylabel('Total Prey Population')
end

% --- P2b RK4 Subplots ---
Method = 'RK4';
for i =1:4
[T2,W2] = ODEsolver(t0,w0,tf,H1(i),'BAR',Method,Pars);
figure(2)
subplot(1,4,i);
x = W2(1,:) + W2(2,:) + W2(3,:); y = W2(4,:);
plot(y,x,'linewidth',1);
title(['h='num2str(H1(i))]); axis([0 0.5 0 1]);
sgtitle('Predator vs Prey Population for Varying Stepsize by RK4','FontSize',16)
xlabel('Pred. Pop.')
ylabel('Total Prey Population')
end

% --- P2c RK4 fixed h ---
h = 0.1;
tf = 1000;

% Pred vs individual species plots , as per hint , for understanding
for i =1:3
[T3 ,W3] = ODEsolver(t0,w0,tf, h,'BAR',Method,Pars);
figure(3)
subplot(1,3,i);
x = W3(i,:); y = W3(4,:);
plot(y,x,'linewidth',1);
title(['y vs x'num2str(i)]); axis([0 0.7 0 0.7]);
end

% Total prey vs pred
tf = 100;

[T4 ,W4] = ODEsolver(t0,w0,tf, h, 'BAR', Method, Pars);
x = W4(1,:) + W4(2,:) + W4(3,:); y = W4(4,:);
figure(4)
plot(y, x, 'linewidth', 1);
title('Predator vs Total Prey Population for h=0.1 by RK4', 'FontSize', 18)
ylabel('Total Prey Population', 'FontSize', 18)
xlabel('Predator Population', 'FontSize', 18)

fig = gcf; fig.PaperPositionMode = 'auto'; figpos = fig.PaperPosition;
fig.PaperSize = [figpos(3) figpos(4)] ;