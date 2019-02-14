function [T,Y] = ODEsolver(t0, y0,tf, h,f, Method, Pars)
% solves the IVP dy/dt = f(y), y(t0)=y0 on [t0,T]
% using steps of size h with an ODE numerical method described by Method
% The Pars structure contains parameters which are passed to the vector
% field f which should be a function that takes three arguments: t,y, Pars.
%
% Returns Y an array whose columns represent
% the solution at time points T=[t0, t0+h...t0+Nh],
% where N= floor(tf/h).  

steptotf=false;
N= floor((tf-t0)/h);
if (tf>t0+N*h) 
    steptotf=true; 
end
m = length(y0); %y0 is assumed to be a column vector
Y=zeros(m,N+1);
T=zeros(1,N+1);

Y(:,1) = y0;
T(1) = t0;
for n=1:N
  Y(:,n+1) = ODEstep(T(n), Y(:,n),h,f, Method, Pars);
  T(n+1) = T(n)+h;
end

if (steptotf)
  Y = [Y, ODEstep(T(N+1), Y(:,N+1),h, f, Method, Pars)];
T = [T, tf];
end

function ynp1 = ODEstep(tn, yn,h,f, Method, Pars)
% Takes a step using a defined ODE method for solving dy/dt=f(t,y)
%  from tn, yn with stepsize h. 
%
% Options for Method include 'Euler', 'Heun' and 'RK4'.
% 
% The vector field is defined by f (e.g. name of an m-file in single quotes
% or else anonymous function name). f should take the arguments t,y,Pars
% where Pars is a parameter structure whose elements can be any matlab
% object. 
switch(Method)
    case {'Euler', 'euler'}
        ynp1 = yn + h*feval(f, tn, yn, Pars);
    case {'Heun', 'heun'}
        F1 = feval(f, tn, yn, Pars);
        Y1 = yn + h*F1;
        ynp1 = yn + (h/2)*(F1+feval(f, tn+h, Y1, Pars));
    case {'RK4', 'rk4'}
        F1 = feval(f, tn, yn, Pars);
        Y1 = yn + (h/2)*F1;
        F2 = feval(f, tn+h/2, Y1, Pars);
        Y2 = yn + (h/2)*F2;
        F3 = feval(f, tn+h/2, Y2, Pars);
        Y3 = yn + h*F3;
        F4 = feval(f, tn+h, Y3, Pars);
        ynp1 =  yn + (h/6)*(F1 + 2*F2+2*F3+F4);
    otherwise,
        disp('Method not implemented')
end
