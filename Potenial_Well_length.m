%%**Do not recommend running it's recursive and slows down Computer
%%Sammy Masters
% Parameters
L = 1;               % Length of the well
x = linspace(0, L, 100); % Spatial grid
t = linspace(0, 2, 500); % Time grid
dx = x(2) - x(1);
dt = t(2) - t(1);

% Initial wave function
psi0 = sqrt(2/L) * sin(pi*x/L);

% Potential energy (here, a simple square well)
V = zeros(size(x));

% Create a figure for plotting
figure;

% Time evolution
for n = 1:length(t)
    % Laplacian operator
    laplacian = (circshift(psi0,1) - 2*psi0 + circshift(psi0,-1)) / (dx^2);
    
    % Time-dependent Schrödinger equation
    psi0 = psi0 - 1i * dt * (-(1/2) * laplacian + V.*psi0);
    
    % Plot the results
    plot(x, abs(psi0).^2, 'LineWidth', 2);
    title(['Time evolution - t = ' num2str(t(n))]);
    xlabel('Position (x)');
    ylabel('|\psi(x, t)|^2');
    ylim([0, 1.5]);
    drawnow;
    
    % Pause for a short duration to observe the animation
    pause(0.1);
end
