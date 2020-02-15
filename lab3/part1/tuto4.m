% texture filter  tutorial

I = imread('bag.png');
figure
subplot(4, 4, 1), imshow(I)

% creating textured image using cross entropy
E = entropyfilt(I);


% rescale
Eim = rescale(E);
%figure
subplot(4, 4, 2),imshow(Eim)


% convert to binary image
BW1 = imbinarize(Eim, .8);
subplot(4, 4, 3),imshow(BW1);

% show original 
%figure
imshow(I)

% extracting only button textures
BWao = bwareaopen(BW1,2000);
subplot(4, 4, 4),imshow(BWao)



% smoothing of the edges
nhood = true(9);
closeBWao = imclose(BWao,nhood);
subplot(4, 4, 5),imshow(closeBWao)


% applying a rough mask 
roughMask = imfill(closeBWao,'holes');
subplot(4, 4, 6),imshow(roughMask);

%figure
imshow(I)


% getting top texture
I2 = I;
I2(roughMask) = 0;
subplot(4, 4, 7),imshow(I2)


% calculate texture image
E2 = entropyfilt(I2);
E2im = rescale(E2);
subplot(4, 4, 8),imshow(E2im)


% E2im as global threshhold
BW2 = imbinarize(E2im);
subplot(4, 4, 9),imshow(BW2)



%figure, imshow(I);


% comparing BW2 to I
mask2 = bwareaopen(BW2,1000);
subplot(4, 4, 10),imshow(mask2)


% display segmentation results
texture1 = I;
texture1(~mask2) = 0;
texture2 = I;
texture2(mask2) = 0;
subplot(4, 4, 11),imshow(texture1)
%figure
subplot(4, 4, 12),imshow(texture2)



% outline boundaries between both textures
boundary = bwperim(mask2);
segmentResults = I;
segmentResults(boundary) = 255;
subplot(4, 4, 13),imshow(segmentResults)


% using textured filter in segmentation
S = stdfilt(I,nhood);
subplot(4, 4, 14),imshow(rescale(S))

R = rangefilt(I,ones(5));
subplot(4, 4, 15),imshow(R)