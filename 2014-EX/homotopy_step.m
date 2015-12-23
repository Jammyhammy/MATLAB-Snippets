function [new_x, new_t] = homotopy_step(f, fprime, g, gprime, eps,...
    x, t, t_target)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
% [new_x] = homotopy_step(f, fprime, g, gprime, eps,...
%   x0, t0, t_target, maxitr)
% perfoms a step of the homotopy method as defined by (8.92) through
% (8.96) (on page 480 of the text), starting at point (x0,t0), 
% going in the direction of t_target, and with predictor step length
% epsilon.  For example, suppose the m-files  f_prob_8_27.m,
% g_prob_8_27.m, fp_prob_8_27.m, and gp_prob_8_27.m are 
% in Matlab's working directory and contain the following:
%
%    function [y] = f_prob_8_27(x)
%    y = (x-2)*(x+2);
%    return
% 
%    function [y] = g_prob_8_27(x)
%    y = x^2-5*x+4;
%    return
%
%    function [y] = fp_prob_8_27(x)
%    y = 2*x;
%    return
%
%    function [y] = gp_prob_8_27(x)
%    y = 2*x-5;
%    return
%
% Then, issuing 
%
%   x = -2;
%   t = 0;
%   [x,t] = homotopy_step('f_prob_8_27', 'fp_prob_8_27', ...
%               'g_prob_8_27', 'gp_prob_8_27', 0.4,x, t, 1)
%
% will perform the first step of problem 27 in Chapter 8.
%
% This routine will work when x and y are vectors, as long as f, fprime, 
% g, and gprime return column vectors.

n = size(x,1);
np1 = n+1;
fval  = feval(f,x);
fpval = feval(fprime,x);
gval  = feval(g,x);
gpval = feval(gprime,x);
Hval = (1-t)*fval + t*gval;
Hpval = [(1-t)*fpval + t*gpval, -fval+gval];
Z = null(Hpval);
if(size(null(Z),2) > 1)
    disp('Warning in homotopy_step:  the dimension of null space')
    disp(' of Hprime is greater than 1, so the point (x,t) is a ')
    disp(' singular point of H.')
end

% Normalize the predictor direction --
v_k = Z(:,1)/norm(Z(:,1),2);

% Orient the step in the proper direction --
if(sign(t_target - t)*sign(v_k) < 0)
    v_k = -v_k;
end

% Take the predictor step --
y_k = [x;t];
z_k = y_k + eps*v_k;

% Set up and solve the corrector equations --
n_iter = 0;
y = z_k;
corrector_F = ones(n+1,1);
while(norm(corrector_F,2) > 1e-10) 
    n_iter = n_iter + 1;
    fval  = feval(f,y(1:n));
    fpval = feval(fprime,y(1:n));
    gval  = feval(g,y(1:n));
    gpval = feval(gprime,y(1:n));
    Hval = (1-y(n+1))*fval + y(n+1)*gval;
    Hpval = [(1-y(n+1))*fpval + y(n+1)*gpval, -fval+gval];
    corrector_F = [Hval;v_k'*(y - z_k)];
    corrector_Fp = [Hpval;v_k'];
    y = y - corrector_Fp\corrector_F;
    if (n_iter > 10)
        disp('Error in homotopy step: Corrector iteration could')
        disp(' not achieve an absolute range tolerance of 10^{-10}')
        disp(' in 10 iterations.')
        new_x = y(1:n);
        new_t = y(n+1);
        return
    end
end
new_x = y(1:n);
new_t = y(n+1);
return







