function Z = srule(f,a0,b0,to10)
% 辛普森公式 为自适应积分做准备 
% Input - f is the integrand input as a string 'f'
%       - a0 and b0 are upper and lower limits of integration
%       - to10 is the tolerance 
% Output- Z is the 1x6 vector [a0,b0,S,S2,err,tol1]
h = (b0-a0)/2;
C = zeros(1,3);
C = feval(f,[a0 (a0+b0)/2 b0]);
S = h*(C(1)+4*C(2)+C(3))/3;
S2 = S;
tol1 = tol0;
err = tol0;
Z = [a0,b0,S,S2,err,tol0];