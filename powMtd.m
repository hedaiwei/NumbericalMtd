function [lambda,V] = powMtd(A,X,epsilon,max1)
% power method 幂法 求出最大特征值和对应的特征向量
% Input - A is an N x N matrix
%       - X is the N x 1 starting vector 
%       - epsilon is the tolerance 
%       - max1 is the maximum number of iterations
% Output- lambda is the dominant eigenvalue 
%       - V is the dominant eigenvector 
% Initialize parameters
lambda = 0;
cnt = 0;
err= 1;
state = 1;
while ((cnt <=max1) & (state == 1))
    Y = A*X;
    % Normalize Y
    [m,j] = max(abs(Y));
    c1 = m;
    dc = abs(lambda - c1);
    Y = (1/c1)*Y;
    % Update X and lambda and check for convergence
    dv = norm(X-Y);
    err = max(dc,dv); % 上面的几行找出向量和特征值最大的偏差 找完lambda X 再还回去
    X = Y;
    lambda = c1;
    state = 0;
    if (err > epsilon)
        state = 1;
    end
    cnt = cnt+1;
end
V = X;
end