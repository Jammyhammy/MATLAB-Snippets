disp('Assignment 2, Problem 3, bisect_method output');
a=1;
b=2;
f = @(x) x.^2-2;
i_eps=1e-16;
[root,success] = bisect_method(a, b, i_eps, f)
disp('-----------------Code to find k iters of problem--------------------');
i_eps = 1e-2
k_find2(a,b,i_eps)
i_eps = 1e-4
k_find2(a,b,i_eps)
i_eps = 1e-8
k_find2(a,b,i_eps)
i_eps = 1e-16
k_find2(a,b,i_eps)
i_eps = 1e-32
k_find2(a,b,i_eps)
i_eps = 1e-64
k_find2(a,b,i_eps)
i_eps = 1e-128
k_find2(a,b,i_eps)
