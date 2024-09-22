
%read the image
img=imread('pexels.jpg');
%display the image
figure(1)
imshow(img);

 %resizing the image
IR=imresize(img,[500,500]);
%diplay the resize image
figure(2);
imshow(IR);



