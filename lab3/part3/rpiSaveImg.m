% file to access the camera module and capture an image 
% to be run on matlab online
rpi = raspi;


% obtaining the camera
cam = cameraboard(rpi, 'Resolution', '1280x720');

% setup the camera brightness to 70
cam.Brightness = 70;

% taking the picture
img = snapshot(cam)

% display the image
imagesc(img)


% save image of file
save('rpi_img', img)

% write image to png file
imwrite(img, 'rpi_img.png');