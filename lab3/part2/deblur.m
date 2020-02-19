% file to work on deblurring of the image


% loading of the image
I = im2double(imread('cameraman.tif'));
imshow(I);
title('Original Image (courtesy of MIT)');


% applying blurring effect
blurred = imblur(I)
figure, imshow(blurred)


noise_mean = 0;
noise_var = 0.0001;

% applying noise effect
blurred_noisy = imnoise(blurred, 'gaussian', ...
                        noise_mean, noise_var);
figure, imshow(blurred_noisy)
title('Simulate Blur and Noise')



% deblurring using an approximate of the noise-to-signal-power-ratio
estimated_nsr = noise_var / var(I(:));
wnr3 = deconvwnr(blurred_noisy, PSF, estimated_nsr);
figure, imshow(wnr3)
title('Restoration of Blurred, Noisy Image Using Estimated NSR');






function blurred = imblur(im)
    LEN = 21;
    THETA = 11;
    PSF = fspecial('motion', LEN, THETA);
    blurred = imfilter(im, PSF, 'conv', 'circular');
end 



 