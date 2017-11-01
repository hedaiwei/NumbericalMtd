function [C,X,Y] = chebyApx(fun,n,a,b)
% ÇÐ±ÈÑ©·ò±Æ½ü
% Input - fun sis the string function to be approximated
%       - N is the degree of the Cebyshev interpolating polynomial
%       - a is the left end point 
%       - b is the right end point
%Output - C is the coefficient list for the polynomial
%       - X contains the abscissas
%       - Y contains the ordinates
if nargin == 2, a = -1;b = 1;end
d = pi/(2*n+2);
C = zeros(1:n+1);
for k = 1:n+1
    X(k) = cos((2*k-1)*d);
end
X = (b-a)*X/2+(a+b)/2;
x = X;
Y = eval(fun);
for k = 1:n+1
    z = (2*k-1)*d;
    for j = 1:n+1
        C(j) = C(j)+Y(k)*cos((j-1)*z);
    end
end
C = 2*C/(n+1);
C(1) = C(1)/2;

