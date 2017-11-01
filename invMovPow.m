function [lambda,V] = invMovPow(A,X,alpha,epsilon,max1)
% 移位反幂法 矩阵 N x N 设有N个特征值 alpha一个实数 满足对任意
% | lambda(j) - alpha | < | lambda(i) - alpha |
% Tips  - 解出来的是用移位出来的特征值
% Input - A is an N x N matrix 
%       - X is the N x 1 starting vector 
%       - alpha is the given shift 
%       - epsilon is the tolerance 
%       - max1 is the maximum number of iterations
% Output- lambda is the dominant eigenvalue
%       - V is the dominant eigenvector
% Initialize the matrix A - alphaI and parameters
[n n] = size(A);
A = A-alpha*eye(n);
lambda = 0;
cnt = 0;
err = 1;
state = 1;
while ((cnt <= max1)&(state == 1))
    % Slove system AY = X
    Y = A\X;
    % Normalize Y
    [m j] = max(abs(Y));
    c1 = m;
    dc = abs(lambda-c1);
    Y = (1/c1)*Y;
    % Update X and lamba and check for convergence
    dv = norm(dc,dv);
    X = Y;
    lambda = c1;
    state = 0;
    if (err > epsilon)
        state = 1;
    end
    cnt = cnt+1;
end
lambda = alpha+1/c1;
V = X;