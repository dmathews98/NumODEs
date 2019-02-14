% Biological Arms Race Vector Field
function f=BAR(t,w,Pars)
m1 = Pars.m1; m2=Pars.m2; m3=Pars.m3;
a = Pars.a; sigma = Pars.sigma; K = Pars.K; alpha = Pars.alpha;

x1 = w(1); x2 = w(2); x3=w(3); y=w(4);
x=x1+x2+x3;

f1 = (alpha/x)*(x1 + x2/2)^2 -alpha*x1*x/K - m1*x1*y/(a+x);
f2 = (2*alpha/x)*(x1 + x2/2)*(x3 + x2/2) -alpha*x2*x/K- m2*x2*y/(a+x);
f3 = (alpha/x)*(x3 + x2/2)^2 - alpha*x3*x/K - m3*x3*y/(a+x);
f4 = y *((m1*x1 +m2*x2 + m3*x3)/(a+x) - sigma);

f = [f1; f2; f3; f4]; % column vector
end