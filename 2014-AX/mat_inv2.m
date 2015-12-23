
function b = mat_inv2(a)
% Find dimensions of input matrix
[r,c] = size(a);

% If input matrix is not square, stop function
if r ~= c
    disp('Only Square Matrices, please')
    b = [];
    return
end

% Target identity matrix to be transformed into the output
% inverse matrix
b = eye(r);

%The following code actually performs the matrix inversion
for j = 1 : r
    for i = j : r
        if a(i,j) ~= 0
            for k = 1 : r
                s = a(j,k); a(j,k) = a(i,k); a(i,k) = s;
                fprintf('s:%d ',s)
                s = b(j,k); b(j,k) = b(i,k); b(i,k) = s;
                fprintf('s:%d ',s)
            end
            fprintf('\n')
            disp(a);
            disp(b);
            t = 1/a(j,j);
            fprintf('\nt:%d\n',t)
            for k = 1 : r
                a(j,k) = t * a(j,k);
                z = a(j,k);
                fprintf('z:%d ',z) 
                b(j,k) = t * b(j,k);
                z = a(j,k);
                fprintf('z:%d ',z) 
            end
            fprintf('\nt:%d\n',t)
            disp(a);
            disp(b);
            for L = 1 : r
                if L ~= j
                    t = -a(L,j);
                    fprintf('\nt:%d\n',t)
                    disp(a);
                    for k = 1 : r
                        a(L,k) = a(L,k) + t * a(j,k);
                        y = a(L,k);
                        fprintf('y:%d ',y)
                        b(L,k) = b(L,k) + t * b(j,k);
                        y = b(L,k);
                        fprintf('y:%d ',y) 
                    end
                    fprintf('\n')
                    disp(a);
                    disp(b);
                end
            end           
        end
        break
    end
    % Display warning if a row full of zeros is found
    if a(i,j) == 0
        disp('Warning: Singular Matrix')
        b = 'error';
        return
    end
end
% Show the evolution of the input matrix, so that we can
% confirm that it became an identity matrix.
a