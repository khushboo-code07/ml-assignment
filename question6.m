% Define the radius of the circle
R = 29; 

% Define the number of points 
numPoints = 100;

% Initialize arrays to hold x and y coordinates
x = zeros(1, numPoints);
y = zeros(1, numPoints);

% Compute the coordinates of the circle
theta = linspace(0, 2*pi, numPoints); % Generate theta values from 0 to 2*pi
for i = 1:numPoints
    x(i) = R * cos(theta(i));
    y(i) = R * sin(theta(i));
end

% Plot the circle
figure;
plot(x, y, 'b-'); % Plot with a blue line
axis equal; % Equal scaling for x and y axes
 
title('Khushboo- 2D Circle');
xlabel('X');
ylabel('Y');
