% euler.m
%
% Approximate solution of an ordinary differential equation intial 
% value problem using (constant stepsize) Euler's method
%
% The ODE IVP is assumed to have the form
%   y' = f(t,y),  y(t0)=y0, t in [t0, tfinal]
%
% The script uses Euler's method
%
%   y_{n+1} = y_n + h f(t_n, y_n) n=0,1,2,..., N-1; h = (tfinal-t0)/N
%
% We only specify t0, h, and N.  tfinal is then automatically tN = t0+hN
% Before running this script
%   (i) define y0, t0, h, and N 
%   (ii) edit the "f = inline(...)" to define the right hand side 
%
% The script returns two arrays:
%       a vector T of t values: T=[t0, t1=t0+h, ... tN = t0+N*h]
%       a vector Y of y values: Y=[y0, y1, y2, ... yN]
%
% Note: if f maps RxR^d to R^d and y0 is a d-dimensional column vector
% then this script will output a solution to the associated system of 
% differential equations
%
% Example usage for a population growth example
%
% 	>> t0 = 0; y0 = 1; h=0.1; N=10;
% 	>>f = @(t,y) 2*y;    
% 	>> euler
%     >> plot(T,Y)
% 
%      NOTE: even when there is no t-dependence
%            in f we should include the argument t
%            in the function definition
%
% use the following for a ballistics example (in 4D)
%  	>> t0 = 0; y0 = [0; 2; 1; 1]; h = 0.1; N=100; 
%	>> f= @(t,y) [y(3); y(4); 0; -9.812];
%	>> euler
%     >> plot(Y(1,:), Y(2,:)) 
%
% 
yn = y0;   % initialize the current step to to be the initial condition
tn = t0;
T = [t0];  % A list with one element
Y = [y0];  % A list with one element
%
% now loop from n=0 to n=N-1, computing a sequence of steps of Euler's
% method
for n=0:N-1
    tnp1 = tn+h;
    ynp1 = yn + h*f(tn,yn);
    T = [T, tnp1]; %concatenates next t-value
    Y = [Y, ynp1]; %concatenates next y-value
    tn= tnp1; yn = ynp1; % reset these for the next step
end

    
