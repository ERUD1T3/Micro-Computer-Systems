
% read image and change it into grayscale
rgb = imread('pears.png');
I = rgb2gray(rgb);
subplot(4, 4, 1), imshow(I)

text(732,501,'Image courtesy of Corel(R)',...
     'FontSize',7,'HorizontalAlignment','right')
 
 % computing gradient magnitude
 gmag = imgradient(I);
subplot(4, 4, 2), imshow(gmag,[])
title('Gradient Magnitude')

% watershed transform on gradient magnitude

L = watershed(gmag);
Lrgb = label2rgb(L);
subplot(4, 4, 3), imshow(Lrgb)
title('Watershed Transform of Gradient Magnitude')


% marking forground objects
se = strel('disk',20);
Io = imopen(I,se);
subplot(4, 4, 4), imshow(Io)
title('Opening')


% computing opening by reconstruction
Ie = imerode(I,se);
Iobr = imreconstruct(Ie,I);
subplot(4, 4, 5), imshow(Iobr)
title('Opening-by-Reconstruction')


% closing
Ioc = imclose(Io,se);
subplot(4, 4, 6), imshow(Ioc)
title('Opening-Closing')

%image dilation then reconstruction 
Iobrd = imdilate(Iobr,se);
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
subplot(4, 4, 7), imshow(Iobrcbr)
title('Opening-Closing by Reconstruction')



% calculate regional maxima
fgm = imregionalmax(Iobrcbr);
subplot(4, 4, 8), imshow(fgm)
title('Regional Maxima of Opening-Closing by Reconstruction')


% superimpose foreground on original image
I2 = labeloverlay(I,fgm);
subplot(4, 4, 9), imshow(I2)
title('Regional Maxima Superimposed on Original Image')


% removing stray isolated pixels
se2 = strel(ones(5,5));
fgm2 = imclose(fgm,se2);
fgm3 = imerode(fgm2,se2);   

fgm4 = bwareaopen(fgm3,20);
I3 = labeloverlay(I,fgm4);
subplot(4, 4, 10), imshow(I3)
title('Modified Regional Maxima Superimposed on Original Image')


% computing the background markers 
bw = imbinarize(Iobrcbr);
subplot(4, 4, 11), imshow(bw)
title('Thresholded Opening-Closing by Reconstruction')

% water ridge lines
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
subplot(4, 4, 12), imshow(bgm)
title('Watershed Ridge Lines)')


% computing watershed transform of segmentation function
gmag2 = imimposemin(gmag, bgm | fgm4);
L = watershed(gmag2);

% watermark and object boundaries
labels = imdilate(L==0,ones(3,3)) + 2*bgm + 3*fgm4;
I4 = labeloverlay(I,labels);
subplot(4, 4, 13), imshow(I4)
title('Markers and Object Boundaries Superimposed on Original Image')



% colored watershed labels
Lrgb = label2rgb(L,'jet','w','shuffle');
subplot(4, 4, 14), imshow(Lrgb)
title('Colored Watershed Label Matrix')

% superimpose on original image
subplot(4, 4, 15), imshow(I)
hold on
subplot(4, 4, 16), 
himage = imshow(Lrgb);
himage.AlphaData = 0.3;
title('Colored Labels Superimposed Transparently on Original Image')



