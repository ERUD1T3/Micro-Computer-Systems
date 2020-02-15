% Treshholding 

I = imread('rice.png');

subplot(3,3,1), imshow(I)


% remove all structural elements
se = strel('disk',15)


% show background without structural elements
background = imopen(I,se);
subplot(3,3,2),imshow(background)


% substracting background from the original image
I2 = I - background;
subplot(3,3,3),imshow(I2)

% alternate way of obtaining image without background
% I2 = imtophat(I,strel('disk',15));

% adjust the image to increase the contrast 
I3 = imadjust(I2);
subplot(3,3,4),imshow(I3)



% create binary version of the image
bw = imbinarize(I3);
bw = bwareaopen(bw,50);
subplot(3,3,5),imshow(bw)



% find connected components in image
cc = bwconncomp(bw,4)



% display the number of those connected components
cc.NumObjects



% view the rice grain labelled 50
grain = false(size(bw));
grain(cc.PixelIdxList{50}) = true;
subplot(3,3,6),imshow(grain)



% create a label matrix for the output
labeled = labelmatrix(cc);
whos labeled



% create RGB image of the original based on labels
RGB_label = label2rgb(labeled,'spring','c','shuffle');
subplot(3,3,7),imshow(RGB_label)

% compute the area of each object in the image
graindata = regionprops(cc,'basic')


% store area data about each grain
grain_areas = [graindata.Area];



% find the area of the 50th grain
grain_areas(50)


% display the grain with the smallest area
[min_area, idx] = min(grain_areas)
grain = false(size(bw));
grain(cc.PixelIdxList{idx}) = true;
subplot(3,3,8),imshow(grain)



% plot a histogram of the rice grain area
histogram(grain_areas)
title('Histogram of Rice Grain Area')









