circles_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\circles.jpg';
penggray_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\penguinsgray.jpg';
pengrgb_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\penguinsrgb.jpg';
pout_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\pout.png';
redcirc_path = 'C:\Users\Josias Moukpe\Desktop\Micro-Computer-Systems\lab3\imgs\redcircles.jpg';


%arrays to store images 
Imgs = {imread(circles_path), imread(redcirc_path), imread(penggray_path), imread(pengrgb_path), imread(pout_path) }







% apply 4 segmentations to images from RPi-Camera