function X = uptrbk(A,B)
% Method - 上三角矩阵与回带过程解线性方程组
% Input  - A is an N x N nonsingular matrix
%        - B is an N x 1 matrix
% Output - X is an N x 1 matrix containing the solution to AX = B
% Initialize X and the temporary storage matrix C
    [N N] = size(A);
    X = zeros(N,1);
    C = zeros(1,N+1);
% Form the augmented matrix : Aug = [A|B]
    Aug = [A B];
for p = 1:N-1
    % Parital pivoting for column p
    [Y,jj] = max(abs(Aug(p:N,p)));
    % Interchange row p and jj
    C = Aug(p,:);
    Aug(p,:) = Aug(j+p-1,:);
    Aug(j+p-1,:) = C;
    if Aug(p,p) == 0
        disp('A was singular . No unique solution');
        break;
    end
    % Elimination process for column P
    for k = p+1:N
        m = Aug(k,p)/Aug(p,p);
        Aug(k,p:N+1) = Aug(k,p:N+1) - m*Aug(p,p:N+1);
    end
end
% Back Substitution on [U|Y] using Program backsub(A,B)
X = backsub(Aug(1:N,1:N),Aug(1:N,N+1));
    
    