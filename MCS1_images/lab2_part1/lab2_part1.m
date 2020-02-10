% file for reading images

%list of paths for the images to work on
circles_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part1\circles.jpg';
penggray_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part1\penguinsgray.jpg';
pengrgb_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part1\penguinsrgb.jpg';
pout_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part1\pout.png';
redcirc_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part1\redcircles.jpg';

%arrays to store images 
Img1 = imread(circles_path);
Img2 = imread(redcirc_path);
Img3 = imread(penggray_path);
Img4 = imread(pengrgb_path);
Img5 = imread(pout_path);

%equalize all images
whos Img1;
%imhist(Img1);
gsImg1 = rgb2gray(Img1);
bImg1 = imbinarize(gsImg1);
eqImg1 = histeq(Img1);
figure
subplot(2,2,1), imshow(Img1);
title('Normal')
subplot(2,2,2), imshow(gsImg1);
title('Gray')
subplot(2,2,3), imshow(bImg1);
title('Binary')
subplot(2,2,4), imshow(eqImg1);
title('Equalized')
%imwrite(eqImg1, 'C:\Users\Josias Moukpe\Desktop\MCS1_images\eqcircles.jpg');


%equalize all images
whos Img2;
%imhist(Img1);
gsImg2 = rgb2gray(Img2);
bImg2 = imbinarize(gsImg2);
eqImg2 = histeq(Img2);
figure
subplot(2,2,1), imshow(Img2);
title('Normal')
subplot(2,2,2), imshow(gsImg2);
title('Gray')
subplot(2,2,3), imshow(bImg2);
title('Binary')
subplot(2,2,4), imshow(eqImg2);
title('Equalized')
%imwrite(eqImg1, 'C:\Users\Josias Moukpe\Desktop\MCS1_images\eqcircles.jpg');


%equalize all images
whos Img3;
%imhist(Img1);
gsImg3 = rgb2gray(Img3);
bImg3 = imbinarize(gsImg3);
eqImg3 = histeq(Img3);
figure
subplot(2,2,1), imshow(Img3);
title('Normal')
subplot(2,2,2), imshow(gsImg3);
title('Gray')
subplot(2,2,3), imshow(bImg3);
title('Binary')
subplot(2,2,4), imshow(eqImg3);
title('Equalized')
%imwrite(eqImg1, 'C:\Users\Josias Moukpe\Desktop\MCS1_images\eqcircles.jpg');


%equalize all images
whos Img4;
%imhist(Img1);
gsImg4 = rgb2gray(Img4);
bImg4 = imbinarize(gsImg4);
eqImg4 = histeq(Img4);
figure
subplot(2,2,1), imshow(Img4);
title('Normal')
subplot(2,2,2), imshow(gsImg4);
title('Gray')
subplot(2,2,3), imshow(bImg4);
title('Binary')
subplot(2,2,4), imshow(eqImg4);
title('Equalized')
%imwrite(eqImg1, 'C:\Users\Josias Moukpe\Desktop\MCS1_images\eqcircles.jpg');


%equalize all images
whos Img5;
%imhist(Img1);
gsImg5 = rgb2gray(Img5);
bImg5 = imbinarize(gsImg5, 'adaptive'); %play with param for better bin
eqImg5 = histeq(Img5);
figure
subplot(2,2,1), imshow(Img5);
title('Normal')
subplot(2,2,2), imshow(gsImg5);
title('Gray')
subplot(2,2,3), imshow(bImg5);
title('Binary')
subplot(2,2,4), imshow(eqImg5);
title('Equalized')
%imwrite(eqImg1, 'C:\Users\Josias Moukpe\Desktop\MCS1_images\eqcircles.jpg');

