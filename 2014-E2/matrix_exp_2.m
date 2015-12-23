function matrix_exp_2(A)
[V,D] = eig(A);
E = V*diag(exp(diag(D)))/V;
disp('Matrix Exponential with Eigenvalues');
disp(E);
end

