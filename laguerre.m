function L = laguerre(n, alpha, x)
    L = zeros(size(x)); % Initialize L to store Laguerre polynomial values
    for i = 0:n
        a1 = 1;
        for j = 1:i
            a1 = a1 * (alpha + j);
        end
        L = L + ((-1)^i * nchoosek(n+alpha, n-i) * x.^i) / a1;
    end
end