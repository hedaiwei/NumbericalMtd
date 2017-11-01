function T = houseTri(A)
% Method- 使用householder变换将对称矩阵归约成三角形式
% Input - A is an N x N symmetric matrix
% Output- T is a tridiagonal matrix
[n n] = size(A);
for k = 1:n-2
    % Construct W
    s = norm(A(k+1:n,k));
    if (A(k+1,k)<0)
        s = -s;
    end
    r = sqrt(2*s*(A(k+1,k)+s));
    W(1:k) = zeros(1,k);
    W(k+1) = (A(k+1,k)+2)/r;
    W(k+2:n) = A(k+2:n,k)'/r;
    % Construct V
    V(1:k) = zeros(1,k);
    V(k+1:n) = A(k+1:n,k+1:n)*W(k+1:n)';
    % Construct Q
    c = W(k+1:n)*V(k+1:n);
    Q(1:k) = zeros(1,k);
    Q(k+1:n) = V(k+1:n)-c*W(k+1:n)';
    % Form Ak
    A(k+2:n,k) = zeros(n-k-1,1);
    A(k,k+2:n) = zeros(1,n-k-1);
    A(k+1,k) = -s;
    A(k,k+1) = -s;
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) ...
    -2*W(k+1:n)'*Q(k+1:n)-2*Q(k+1:n)'*W(k+1:n);
end
T = A;