%read the grayscale image
img = imread('baboon.png');

%specify the target size
targetSize = [92,92];

%resize the image
img = imresize(img, targetSize);

%reshape the image into a 1d array
img_1d = reshape(img, 1, []);

%write the data to a file
dlmwrite('input.txt', img_1d, 'delimiter', ' ');