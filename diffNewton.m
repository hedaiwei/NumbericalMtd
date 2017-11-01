function [A,df] = diffNewton(X,Y)
% N次牛顿法求解微分近似值
% Input - X is the 1 x N abscissa vector 
%       - Y is the 1 x N ordinate vector 
% Output- A is the 1 x N vector containing the coefficients of the Nth 
%           degree Newton polynomial
%       - df is the approximate derivative
A = Y;
N = length(X);
for j = 2:N
    for K = N:-1:j
        A(k) = (A(k)-A(k-1))/(X(k)-X(k-j+1));
    end
end
x0 = X(1);
df = A(2);
prod = 1;
n1 = length(A)-1;
for k = 2:n1
    prod = prod*(x0-X(k));
    df = df+prod*A(k+1);
end