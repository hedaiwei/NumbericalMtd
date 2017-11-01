function [P,iter,err] = newdi(F,JF,P,delta,epsilon,max1)
% 牛顿拉夫逊迭代法 非线性方程组
% Input - F is the system saved as the M-file F.m
%       - JF is the Jacobian of F saved as the M-file JF.m
%       - P isthe initial approximation to the solution 
%       - delta is the tolerance for P 
%       - epsilon is the tolerance for F(P)
%       - max1 is the maximum number of iteration 
% Output- P is the approximation to the solution 
%       - iter is the number of iterations required 
%       - err is the error estimate for P
Y = feval(F,P);
for k = 1:max1
    J = feval(JF,P);
    Q = P-(J\Y');
    Z = feval(F,Q);
    err = norm(Q-P);
    relerr = err/(norm(Q)+eps);
    P = Q;
    Y = Z;
    iter = k;
    if (err<delta)|(relerr<delta)|(abs(Y)<epsilon)
        break;
    end
end