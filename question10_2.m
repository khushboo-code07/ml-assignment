%read the coloue image
a=imread('flowers.jpg');
figure(1);
%display the coloured image
imshow(a);
%convert the colour image to grayscale iamge
grayimage=rgb2gray(a);
figure(2);
%display the grayscale image
imshow(grayimage);
%save the grayscale image
imwrite(grayimage,flower2_gray.jpg);
