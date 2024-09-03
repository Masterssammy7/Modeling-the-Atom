function psi = schrodinger_wavefunction(N, L, M, r, theta, phi)
    % Calculate the radial wavefunction and spherical harmonics
    [R_nl, Y_lm] = bohr_wavefunction(N, L, M, r, theta, phi);
    % Combine radial and angular parts
    psi = R_nl .* Y_lm;
end