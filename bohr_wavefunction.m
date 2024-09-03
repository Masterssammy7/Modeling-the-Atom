function [R_nl, Y_lm] = bohr_wavefunction(N, L, M, r, theta, phi)
    % Constants
    a_0 = 1; % Bohr radius (in atomic units)
    % Radial wavefunction (in atomic units)
    R_nl = sqrt((2 / (N * a_0))^3 * factorial(N - L - 1) / (2 * N * factorial(N + L))) * ...
           exp(-r / (N * a_0)) .* (2 * r / (N * a_0)).^L .* laguerre(N - L - 1, 2*L + 1, 2*r / (N * a_0));
    % Spherical harmonics
    Y_lm = legendre(L, cos(theta));
    Y_lm = Y_lm(abs(M) + 1, :);
    if M < 0
        Y_lm = sqrt(2) * sin(abs(M) * phi) .* Y_lm;
    elseif M > 0
        Y_lm = sqrt(2) * cos(M * phi) .* Y_lm;
    else
        Y_lm = Y_lm;
    end
end