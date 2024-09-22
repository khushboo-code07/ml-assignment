% Read the grayscale image
grayImage = imread('gray_image.png');


if size(grayImage, 3) == 3
    grayImage = rgb2gray(grayImage);
end

% Convert the grayscale image to a 1D array
pixelArray = grayImage(:);

% Display the size of the 1D array
disp(['The 1D array has ', num2str(length(pixelArray)), ' pixels.']);

% Display the first few pixel values for inspection
disp('First few pixel values:');
disp(pixelArray(1:10));