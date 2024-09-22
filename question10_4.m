%load the 1DArray
oneDArray = rand(1, 10000);

%defining the image dimensions
width = 100; 
height = 100; 

%reshape the 1D Array
grayImage = reshape(oneDArray, [height, width]);

%display the grayscale image
imshow(grayImage, []);
title('Grayscale Image from 1D Array');

%save the gray scale image
imwrite(grayImage, 'gray_image.png');