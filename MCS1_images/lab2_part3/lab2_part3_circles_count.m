circles_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part3\circles.jpg';

%laoding images
Img1 = imread(circles_path);

imshow(Img1)
d1 = imdistline

gsImg1 = rgb2gray(Img1);
bImg1 = imbinarize(gsImg1);
%sImg1 = edge(gsImg1,'sobel');
cImg1 = edge(gsImg1,'canny');
%imshow(gsImg1)

[centers,radii] = imfindcircles(cImg1, [20 100],'ObjectPolarity','dark', ...
    'Sensitivity',.92)


num = length(centers)

figure
imshow(Img1)
title([num2str(num),' Circle(s)'])
h = viscircles(centers,radii, 'Color', 'g');


% call hsvMask function to get the mask and the filtered image
[maskB,maskedImageB] = hsvMask(Img1, .90, .29); %blue mask
[maskO,maskedImageO] = hsvMask(Img1, .1, .0); %red-orange mask
[maskR,maskedImageR] = hsvMask(Img1, 1., .9); %red mask
[maskY,maskedImageY] = hsvMask(Img1, .4, .11); %yellow mask
[maskD,maskedImageD] = hsvMask(Img1, .965, .188); %Dark mask


[centers,radii] = imfindcircles(maskB, [20 100],'ObjectPolarity','dark', ...
    'Sensitivity',.91)


num = length(radii);
figure
subplot(2, 2, 1),imshow(Img1)
title([num2str(num),' Blue Circle(s)'])
h = viscircles(centers,radii, 'Color', 'g');

%figure
%imshow(maskB)

[centers,radii] = imfindcircles(maskO, [20 100],'ObjectPolarity','dark', ...
    'Sensitivity',.91)


num = length(radii);


subplot(2, 2, 2),imshow(Img1)
title([num2str(num),' Orange Circle(s)'])
h = viscircles(centers,radii, 'Color', 'g');


[centers,radii] = imfindcircles(maskR, [20 100],'ObjectPolarity','dark', ...
    'Sensitivity',.91)


num = length(radii);


subplot(2, 2, 3),imshow(Img1)
title([num2str(num),' Red Circle(s)'])
h = viscircles(centers,radii, 'Color', 'g');



[centers,radii] = imfindcircles(maskY, [20 100],'ObjectPolarity','dark', ...
    'Sensitivity',.91)


num = length(radii);


subplot(2, 2, 4),imshow(Img1)
title([num2str(num),' Yellow Circle(s)'])
h = viscircles(centers,radii, 'Color', 'g');



function [BW,maskedRGBImage] = hsvMask(RGB, minH, maxH) 
% Convert RGB image to HSV image
I = rgb2hsv(RGB);
% Define thresholds for 'Hue'. Modify these values to filter out different range of colors.
channel1Min = minH;
channel1Max = maxH;
% Define thresholds for 'Saturation'
channel2Min = .0;
channel2Max = 1.0;
% Define thresholds for 'Value'
channel3Min = .0;
channel3Max = 1.0;

% Create mask based on chosen histogram thresholds
BW = ( (I(:,:,1) >= channel1Min) | (I(:,:,1) <= channel1Max) ) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
% Initialize output masked image based on input image.
maskedRGBImage = RGB;
% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;
end