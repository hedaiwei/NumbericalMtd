function quad = guassIter(f,a,b,A,W)
% 高斯勒让德求积分
% Input - f is the integrand input as a strig 'f'
%       - a and b are upper and lower limits of integration
%       - A is the 1 x N vector of abscissas from Table 7.9
%       - W is the 1 x N vector of weights form Table 7.9
% Output- quad is the quadrature value
N = length(A);
T = zeros(1,N);
T = ((a+b)/2)+((b-a)/2)*A; % 归一化处理
quad = ((b-a)/2)*sum(W.*feval(f,T));