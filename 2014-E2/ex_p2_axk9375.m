% Adil Khokhar
% CLID: axk9375
% Exam 2 Question 2

A = [2 -1; -1 2];
B = [ -49 24; -64 21];

matrix_exp_1(A);
matrix_exp_1(B);

matrix_exp_2(A);
matrix_exp_2(B);

disp('Matrix exponential with MATLAB function');
expm(A)
expm(B)
disp('We can see from this that using eigenvalues is more accurate and robust');

function matrix_exp_2(A)
[V,D] = eig(A);
E = V*diag(exp(diag(D)))/V;
disp('Matrix Exponential with Eigenvalues');
disp(E);
end

function matrix_exp_2(A)
[V,D] = eig(A);
E = V*diag(exp(diag(D)))/V;
disp('Matrix Exponential with Eigenvalues');
disp(E);
end

