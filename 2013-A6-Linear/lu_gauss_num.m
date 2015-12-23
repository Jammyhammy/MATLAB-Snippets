% LU Decomposition with Gaussian Method
% A = coefficient matrix
% x = output matrix, will output the LU decomposition in A
% upper triangular matrix U in A.
% num = num of operations

function num_l = lu_gauss_num(A)

num = 0;
[m,n] = size(A);
if m~=n, error ('Matrix A must be square'); end
for k = 1:n-1
    for i = k+1:n
        % Forward Substitution
        A(i,k) = A(i,k)/A(k,k);
        num = num + 1;
        
        if A(k,k) == 0, error('Null diagonal element'); end
        
            for j = k+1:n
                A(i,j) = A(i,j) - A(i,k)*A(k,j);
                num = num + 2;
            end
            
    end
    
end

% Get LU form back from A.

L = tril(A);
U = triu(A);
for k = 1:n
    L(k,k) = 1;
end
num_l = num;
end


