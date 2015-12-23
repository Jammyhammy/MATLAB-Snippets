% Following Example from the book to illustrate Cramer's rule for a 3x3
% matrix. Because of its constraints, it absolutely has to be implemented
% as a script.

% 0.3x1 + 0.52x2 + x3 = -0.01
% 0.5x1 + 1x2 + 1.9x3 = 0.67
% 0.1x1 + 0.3x2 + 0.5x3 = -0.44
disp('Cramers Rule');
X = [ 0.3    0.52    1     ;
      0.5    1       1.9   ;
      0.1    0.3     0.5   ; ]
b = [ -0.01  0.67   -0.44    ]

num_c = 0;

X1 = X;
X2 = X;
X3 = X;

X1(:,1) = b;
X2(:,2) = b;
X3(:,3) = b;

num_c = num_c + 3;

% D = 0.3 * ( 1 * 0.5 - 1.9 * 0.3) - 0.52 * (0.5 * 0.5 - 1.9 * 0.1) + 1 (0.5 * 0.3 - 1 * 0.1);
% For the sake of simplicity, just use det(X) for determinant, but count
% the operations it takes to find the determinant and assume it for all
% other determinants, as they are also 3x3 square matrices.

Dx = det(X);
num_c = num_c + 14;
Dx1 = det(X1);
num_c = num_c + 13;
Dx2 = det(X2);
num_c = num_c + 13;
Dx3 = det(X3);
num_c = num_c + 13;

Y1 = Dx1/Dx;
num_c = num_c + 1;
Y2 = Dx2/Dx;
num_c = num_c + 1;
Y3 = Dx3/Dx;
num_c = num_c + 1;
fprintf('X1: %f, X2: %f, X3: %f \n', Y1, Y2, Y3);