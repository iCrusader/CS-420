dimension= [92,92];

% Read the results from the C program
c_values = load('c_output.txt');%https://www.mathworks.com/matlabcentral/answers/465979-how-to-read-a-txt-file-and-convert-to-an-image-in-matlab
c_values = uint8(c_values); 
c_image = reshape(c_values, dimension); 

% Display the prolog image
p_values = load('prolog_output.txt');
p_values = uint8(p_values); 
p_image = reshape(p_values, dimension); 

h_values = load('haskell_output.txt');
h_values = uint8(h_values); 
h_image = reshape(h_values, dimension); 

%https://www.mathworks.com/matlabcentral/answers/429149-how-do-i-use-the-subplot-command-in-matlab-to-display-all-4-images-d1-through-d4-and-label-the-plots
figure;
subplot(2,2,4)
imshow(c_image);
title('Black & White Image');
subplot(2,2,2);
imshow(p_image);
title('Reverse Image');
subplot(2,2,3);
imshow(h_image);
title('Inverse Color Image');
subplot(2,2,1);
imshow('mickey-1.png');
title('Original Image');