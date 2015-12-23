function k_find2(a,b,eps)
    N=(log((b-a)/eps)/log(2))-1;
    for k=1:N
        k=1+k;
    end
    while(k<N)
        k=1+k;
    end
    if(k>N)
        fprintf('k=%d\n',k);
    end
end

