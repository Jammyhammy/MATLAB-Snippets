function x   = GaussNaive(A,b)
% GaussNaive: naive Gauss distribution from Applied Numerical Methods
% x = GaussNaive(A,b) = Gauss elimination without pivoting.
% input:
% A = coefficient matrix
% b = right hand side vector
% output:
% x = solution vector
% num = number of operations

[m,n] = size(A);
if m~=n, error ('Matrix A must be square'); end
nb = n+1;
Aug = [ A b ];

num = 0;
% Forward Elimination
for k = 1:n - 1
    for i = k+1:n
        factor = Aug(i,k)/Aug(k,k);
        num = num + 1;
        Aug(i,k:nb) = Aug(i,k:nb) - factor * Aug(k,k:nb);
        num = num + 2;
    end
end
% Back Substitution
x = zeros(n,1);
num = num + 1;
x(n) = Aug(n,nb)/Aug(n,n);
num = num + 1;
for i = n-1:-1:1
    x(i) = (Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
    num = num + 3;
end
disp(num);
end
