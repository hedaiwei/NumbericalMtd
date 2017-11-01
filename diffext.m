function [D,err,relerr,n] = diffext(f,x,delta,toler)
% 外推法微分求解
% Input - f is the function input as a string 'f'
%       - delta is the tolerance for the error
%       - toler is the tolerance for the relative error
% Output- D is the matrix of approximate derivatives
%       - err is the error bound 
%       - relerr is the relative error bound 
%       - n is the coordinate of the 'best approximation'
err = 1;
relerr = 1;
h = 1;
j = 1;
D(1,1) = (feval(f,x+h)-feval(f,x-h))/(2*h);
while relerr > toler && err > delta && j < 12
    h = h/2;
    D(j+1,1) = (feval(f,x+h)-feval(f,x-h))/(2*h);
    for k = 1:j
        D(j+1,k+1) = D(j+1,k)+(D(j+1,k)-D(j,k))/((4^k)-1);
    end
    err = abs(D(j+1,j+1)-D(j,j));
    relerr = 2*err/(abs(D(j+1,j+1))+abs(D(j,j))+eps);
    j = j+1;
end
[n n] = size(D);