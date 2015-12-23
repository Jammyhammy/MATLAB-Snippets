function  k_find(eps)
    i_eps=inv(eps);
    k = 1;
    i = 2;
    while i < i_eps
        i=2;
        k=k+1;
        i=i.^k;
        disp(fprintf('i_eps: %d k: %d  i:%d',i_eps,k,i));
    end
end

