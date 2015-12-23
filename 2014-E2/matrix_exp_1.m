function E = matrix_exp_1(A)
E = zeros(size(A));
F = eye(size(A));
k = 1;
while(0 < norm(E + F - E, 1))
    E = E + F;
    F = A * F / k;
    k = k + 1;
end
disp('Matrix exponential with series');
disp(E);
end

