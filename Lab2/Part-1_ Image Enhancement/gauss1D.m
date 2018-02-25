function G = gauss1D( sigma , kernel_size )
    G = zeros(1, kernel_size);
    if mod(kernel_size, 2) == 0
        error('kernel_size must be odd, otherwise the filter will not have a center to convolve on')
    end
    %% solution  
    r = floor(kernel_size/2);
    for x = -radius:radius
        G(x + r + 1) = exp((-1/2)*(x/sigma)^2)/(sigma*sqrt(2*pi));
    end
    G = G./sum(G);
end
