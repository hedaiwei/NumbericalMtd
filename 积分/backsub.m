function s = traprl(f,a,b,M)
% 梯形公式求面积
% Input - f is the integrand input as a string 'f'
%       - a and b are upper and lower limits of integration 
%       - M is the number of subintervals
% Output- s is the trapezoidal rule sum
h = (b-a)/M;
s = 0;
for k = 1:(M-1)
    X = a+h*k;
    s = s+feval(f,x);
end
s = h*(feval(f,a)+feval(f,b))/2+h*s;