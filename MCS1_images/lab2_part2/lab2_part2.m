
%list of paths for the images to work
% requires full path
circles_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part2\circles.jpg';
penggray_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part2\penguinsgray.jpg';
pengrgb_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part2\penguinsrgb.jpg';
pout_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part2\pout.png';
redcirc_path = 'C:\Users\Josias Moukpe\Desktop\MCS1_images\lab2_part2\redcircles.jpg';

%laoding images
Img1 = imread(circles_path);
Img2 = imread(redcirc_path);
Img3 = imread(penggray_path);
Img4 = imread(pengrgb_path);
Img5 = imread(pout_path);

%converting images to  grayscale
gsImg1 = rgb2gray(Img1);
gsImg2 = rgb2gray(Img2);
gsImg3 = rgb2gray(Img3);
gsImg4 = rgb2gray(Img4);
gsImg5 = rgb2gray(Img5);

%filters
sImg1 = edge(gsImg1,'sobel');
cImg1 = edge(gsImg1,'canny');
figure;
imshowpair(sImg1,cImg1,'montage')
title('Sobel Filter                                   Canny Filter');

sImg2 = edge(gsImg2,'sobel');
cImg2 = edge(gsImg2,'canny');
figure;
imshowpair(sImg2,cImg2,'montage')
title('Sobel Filter                                   Canny Filter');


sImg3 = edge(gsImg3,'sobel');
cImg3 = edge(gsImg3,'canny');
figure;
imshowpair(sImg3,cImg3,'montage')
title('Sobel Filter                                   Canny Filter');


sImg4 = edge(gsImg4,'sobel');
cImg4 = edge(gsImg4,'canny');
figure;
imshowpair(sImg4,cImg4,'montage')
title('Sobel Filter                                   Canny Filter');

sImg5 = edge(gsImg5,'sobel');
cImg5 = edge(gsImg5,'canny');
figure;
imshowpair(sImg5,cImg5,'montage')
title('Sobel Filter                                   Canny Filter');
