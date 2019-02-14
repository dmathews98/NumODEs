function Emax = ErrorCalc(Tref, Yref, Tq, Yq)
% Tref - vector of times at which the reference 
%        solution has been computed
% Yref - an array of values of the reference solution. 
%        The i'th column of Yref 
%        corresponds to the vector solution at time Tref(i)
% Tq   - a vector of time points where the approximate 
%        solution is defined
% Yq   - an array of values of the approximate solution.
%
% Produces: Emax - the maximum global error
%
EA = Yq' - interp1(Tref, Yref', Tq);
Emax = max(abs(sqrt(sum(EA'.^2))));
