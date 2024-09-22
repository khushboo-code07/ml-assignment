
% Define the radius of the circle
R = 29; 

% Define the number of points used to plot the circle
numPoints = 100; 

% Initialize arrays to hold the x, y, and z coordinates
x = zeros(1, numPoints);
y = zeros(1, numPoints);
z = zeros(1, numPoints);

% Compute the circle coordinates
for i = 1:numPoints
    theta = 2 * pi * (i - 1) / numPoints; % Vary theta from 0 to 2*pi
    x(i) = R * cos(theta);
    y(i) = R * sin(theta);
    z(i) = 0; % z is always 0 for this circle
end

% Plot the circle
figure;
plot3(x, y, z, 'b-', 'LineWidth', 2); % 'b-' is the blue line
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Khushboo - 3D Circle'); 

axis equal;