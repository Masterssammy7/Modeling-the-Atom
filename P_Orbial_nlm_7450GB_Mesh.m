clear; clc;
% Define grid for r, theta, phi
r = linspace(0, 10, 100); % Radial grid
theta = linspace(0, pi, 100); % Polar angle grid
phi = linspace(0, 2*pi, 100); % Azimuthal angle grid

% Define quantum numbers for p orbital
N = 2; % Principal quantum number
L = 1; % Angular momentum quantum number
M_values = [-1, 0, 1]; % Magnetic quantum number for p orbital


% Calculate and sum p orbitals
psi_total = zeros(length(r), length(theta), length(phi));
for i = 1:length(M_values)
    M = M_values(i);
    psi = schrodinger_wavefunction(N, L, M, r, theta, phi);
    psi_total = psi_total + psi;
end

% Reshape psi_total_mesh to match the meshgrid dimensions
psi_total_mesh = abs(psi_total) .* sin(theta.'); % Transpose theta to match dimensions

% Create mesh grid with correct dimensions
[r_mesh, theta_mesh, phi_mesh] = meshgrid(r, theta, phi);

% Convert meshgrid to Cartesian coordinates
x = r_mesh .* sin(theta_mesh) .* cos(phi_mesh);
y = r_mesh .* sin(theta_mesh) .* sin(phi_mesh);
z = r_mesh .* cos(theta_mesh);

% Reshape x, y, z, and psi_total_mesh for slice visualization
% [x_3d, y_3d, z_3d] = meshgrid(x, y, z);
% Plot slices for total p orbital
figure;
num_slices = 10; % Number of slices
slice_spacing = floor(length(z) / num_slices);
for i = 1:num_slices
    slice_index = i * slice_spacing;
    slice_data = psi_total_mesh(:,:,slice_index); % Extract slice data
    
    % Generate grid of X and Y coordinates
    [X, Y] = meshgrid(x, y);
    
    subplot(3, 4, i); % Adjust subplot layout as needed
    slice(X, Y, z(slice_index) * ones(size(slice_data)), slice_data); % Visualize slice using slice
    shading interp; % Interpolate colors
    colormap jet; % Adjust colormap as needed
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title(['Slice at z = ', num2str(z(slice_index))]);
    colorbar;
end