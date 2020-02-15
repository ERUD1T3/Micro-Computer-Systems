he = imread('hestain.png');
subplot(3,2,1),imshow(he), title('H&E image');
text(size(he,2),size(he,1)+15,...
     'Image courtesy of Alan Partin, Johns Hopkins University', ...
     'FontSize',7,'HorizontalAlignment','right');


 
 % convert image from rgb to l*a*b
 lab_he = rgb2lab(he);
 
 
 % classify colors using K-means clustering
 ab = lab_he(:,:,2:3);
ab = im2single(ab);
nColors = 3;
% repeat the clustering 3 times to avoid local minima
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);
subplot(3,2,2),imshow(pixel_labels,[])
title('Image Labeled by Cluster Index');

% create color segmented images

% cluster 1
mask1 = pixel_labels==1;
cluster1 = he .* uint8(mask1);
subplot(3,2,3),imshow(cluster1)
title('Objects in Cluster 1');


% cluster 2
mask2 = pixel_labels==2;
cluster2 = he .* uint8(mask2);
subplot(3,2,4),imshow(cluster2)
title('Objects in Cluster 2');

% cluster 3
mask3 = pixel_labels==3;
cluster3 = he .* uint8(mask3);
subplot(3,2,5),imshow(cluster3)
title('Objects in Cluster 3');


% create and apply dark blue filter
L = lab_he(:,:,1);
L_blue = L .* double(mask3);
L_blue = rescale(L_blue);
idx_light_blue = imbinarize(nonzeros(L_blue));


blue_idx = find(mask3);
mask_dark_blue = mask3;
mask_dark_blue(blue_idx(idx_light_blue)) = 0;

blue_nuclei = he .* uint8(mask_dark_blue);
subplot(3,2,6),imshow(blue_nuclei)
title('Blue Nuclei');
