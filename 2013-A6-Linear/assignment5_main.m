% Adil Khokhar
% CLID: axk9375
% Assignment 5 : Solving system of linear equations (comparison between 
% Cramers, Gaussian Elimination & LU factorization)

num_l = 0;
num_g = 0;

% Call cramers rule using the example 3 x 3 matrix  defined in 
% the textbook.
cramersrule;

% Set up values from Example 9.3 from the book.
disp('Gauss Naive');
G_A = [ 3     -0.1   -0.2  ;
        0.1    7     -0.3  ;
        0.3   -0.2    10   ; ]
G_b = [ 7.85;
        -19.3;
        71.4 ]
    
G_Y = GaussNaive(G_A, G_b);
disp('Solution:')
disp(G_Y);
num_g = GaussNaiveNum(G_A, G_b);

disp('LU Decomposition')
L_A = [ 3     -0.1   -0.2  ;
        0.1    7     -0.3  ;
        0.3   -0.2    10   ; ]
L_b = [ 7.85  ;
        -19.3 ;
        71.4  ; ]

L_Y = lu_gauss(L_A);
num_l = lu_gauss_num(L_A);

fprintf(' Number of Operations Performed Comparison:\n');

fprintf(' Cramers    Gauss Naive    LU Factor\n');
fprintf(' %i ',num_c);
fprintf('         ');
fprintf(' %i ',num_g);
fprintf('         ');
fprintf(' %i ',num_l);
fprintf('\n');
