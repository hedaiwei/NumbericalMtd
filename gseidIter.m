function X = gseidIter(A,B,P,delta,max1)
% 高斯塞德尔迭代法
% Input - A is an N x 1 nonsinguar matrix 
%       - B is an N x 1 matrix 
%       - P is an N x 1 matrix ; the initila guess
%       - delta is the tolerance for P 
%       - max1 is the maximum number of iteration 
% Output- X is an N x 1 matrix: the gauss-seidel
%       - approximation to the solution of AX = B 
N = length(B);
for k = 1:max1
    for j = 1:N 
        if j == 1
            X(1) = (B(1) -A(1,2:N)*P(2:N))/A(1,1);
        elseif j == N 
            X(N) = (B(N)-A(N,1:N-1)*(X(1:N-1))')/A(N,N);
        else
            %X contains the kth approximations and P the (k-1)st
            X(j) = (B(j)-A(j,1:j-1)*X(1:j-1)'-A(j,j+1:N)*P(j+1:N))/A(j,j);
        end 
    end
    err = abs(norm(X'-P));
    relerr = err/(norm(X) +eps);
    P = X';
    if (err<delta)|(relerr<delta)
        break;
    end
end
X = X';