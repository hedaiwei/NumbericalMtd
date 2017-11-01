function [V,D] = jacobiEig(A,epsilon)
% Method- 使用雅可比迭代求特征值 特征向量
% Input - A is an N x N matrix 
%       - epsilon is the tolerance 
% Output- V is the N x N matrix of eigenvectors
%       - D is the diagonal N x N matrix of eigenvalues
% Initialize V,D and parameters
D = A;
[n,n] = size(A);
V = eye(n);
state = 1;
% calc row p and column q of the off-diagonal element of greatest magnitude
% in A
[m1 p] = max(abs(D-diag(diag(D))));
[m2 q] = max(m1);
p = p(q);
while (state == 1)
    % Zero out Dpq and Dqp
    t = D(p,q)/(D(q,q)-D(p,p));
    c = 1/sqrt(t^2+1);
    R = [c s;-s c];
    D([p q],:) = R'*D([p q],:);
    D(:,[p q]) = D(:,[p q])*R;
    V(:,[p q]) = V(:,[p q])*R;
    [m1 p] = max(abs(D-diag(diag(D))));
    [m2 q] = max(m1);
    p = p(q);
    if (abs(D(p,q)) < epsilon*sqrt(sum(diag(D).^2)/n))
        state = 0;
    end
end
D = diag(diag(D));