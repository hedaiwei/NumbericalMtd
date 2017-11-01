function X = backsub(A,B)
% Input - A is an N x N upper-triangular nonsingular matrix
%       - B is an N x 1 matrix
% Output- X is the solution to the linear system AX = B 
% Find the dimension of B and initialize X
n = length(B);
X = zeros(n,1);
X(n) = B(n)/A(n,n);
for k = n-1:-1:1
    X(k) = (B(k) - A(k,k+1:n)*X(k+1:n))/A(k,k);
end