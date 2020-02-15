circles_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\circles.jpg';
penggray_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\penguinsgray.jpg';
pengrgb_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\penguinsrgb.jpg';
pout_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\pout.png';
redcirc_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\redcircles.jpg';



%arrays to store images 
Imgs = {imread(circles_path), imread(redcirc_path), imread(penggray_path), imread(pengrgb_path), imread(pout_path) }

dIm = im2double(Imgs{2})

% apply Weiner Filter Deblurring
noise_var = 0.0001;
estimated_nsr = noise_var / var(dIm(:));
wnr3 = deconvwnr(Imgs{2}, PSF, estimated_nsr);
figure, imshow(wnr3)
title('Restoration of Blurred, Noisy Image Using Estimated NSR');

% apply all 4 segmentations to test images 