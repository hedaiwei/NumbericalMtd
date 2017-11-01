function D = qr2(A,epsilon)
% 带移位的 QR 法求解一个对称三角矩阵特征值
% Input - A is a symmetric tridiagonal N x N matrix
%       - epsilon is the tolerance
% Output- D is the N x 1 vector of eigenvalues
% Initialize parameters
[n,n] = size(A);
m = n;
D = zeros(n,1);
B = A;
while(m>1)
    while (abs(B(m,m-1)) >= epsilon)
        % Calculate shift
        S = eig(B(m-1:m,m-1:m));
        [j,k] = min([abs(B(m,m)*[1 1]'-S)]);
         % QR factorization of B
         [Q,U] = qr(B-S(k)*eye(m));
         % Calc next B
         B = U*Q+S(k)*eye(m);
    end
    % Place mth eigenvaue in A(m,m)
    A(1:m,1:m) = B;
    % Repeat process on the m-1 x m-1 submatrix of A 
    m = m-1;
    B = A(1:m,1:m);
end
D = diag(A);
