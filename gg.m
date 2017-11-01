%% 不动点迭代
function gg
p0 = [-1];
tol = 1e-2;
max1 = 20;
[k,p,err,P] = fixpt(@g,p0,tol,max1)

function out = g(x)
% x1 = x(1);
% x2 = x(2);
% out = [x1+2*x2-2;x1^2+4*x2^2-4];
out = x^2;
