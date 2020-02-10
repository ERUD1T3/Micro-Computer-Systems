redcirc_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part3\redcircles.jpg';
Img2 = imread(redcirc_path);

imshow(Img2)
d2 = imdistline

gsImg2 = rgb2gray(Img2);
bImg2 = imbinarize(gsImg2);
sImg2 = edge(gsImg2,'sobel');
%cImg2 = edge(gsImg2,'canny');
imshow(gsImg2)

%[centers,radii] = imfindcircles(cImg2,[20 30],'ObjectPolarity','dark', ...
 %   'Sensitivity',.92, 'Method', 'twostage')

[centers,radii] = imfindcircles(sImg2,[20 30],'ObjectPolarity','dark', ...
    'Sensitivity',.92)

num = length(centers)

imshow(Img2)
title([num2str(num),' Red Circle(s)'])
h = viscircles(centers,radii, 'Color', 'b');
