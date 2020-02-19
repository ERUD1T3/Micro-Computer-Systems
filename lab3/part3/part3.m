
rpi_img_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\rpi_img.jpg';



%arrays to store images 
Img = imread(rpi_img_path)

dIm = im2double(Img)

% apply Weiner Filter Deblurring
noise_var = 0.0001;
estimated_nsr = noise_var / var(dIm(:));

LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);

wnr3 = deconvwnr(Img, PSF, estimated_nsr);
figure, imshow(wnr3)
title('Restoration of Blurred, Noisy Image Using Estimated NSR');

% apply all 4 segmentations to test images 






% apply 4 segmentations to images from RPi-Camera