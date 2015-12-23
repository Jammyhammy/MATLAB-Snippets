%[V,D] = JacobiEig(A) returns a diagonal matrix D with eigenvalues and

%a matrix V whose columns are the corresponding eigenvectors so that

%A*V = V*D.

function [V,D] = JacobiEig(A)

 

Size = size(A,1);

E = eye(Size);

V = E; % Start with unit matrix

for Rotations=[1:Size^2*20] % Limit number of rotations

  % Find maximum off-diagonal element

  Max = 0;

  for r=1:Size-1

    for c=r+1:Size

      if abs(A(r,c))>Max % New Max found

        p = r 
        q = c

        Max = abs(A(r,c))

      end

    end

  end

 

  % Compare Max with working precision

  if Max<eps

    break % A is diagonalized, stop now   

  end

 

  % Find sin and cos of rotation angle

  theta = (A(q,q)-A(p,p))/(2*A(p,q))

  t = 1/(abs(theta)+sqrt(theta^2+1))

  if theta<0

    t = -t

  end

  c = 1/sqrt(t^2+1)

  s = t*c

 

  % Build rotation matrix

  P = E

  P(p,p) = c

  P(q,q) = c

  P(p,q) = s

  P(q,p) = -s

 

  % Do rotation

  A = P'*A*P

  V = V*P

end

D = diag(spdiags(A,0)) % Return diagonal

