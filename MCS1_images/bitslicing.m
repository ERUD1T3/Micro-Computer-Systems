I = imread('ngc6543a.jpg')


G = rgb2gray(I)


Gpos7 = bitget(G, 7+1);
Gpos6 = bitget(G, 6+1);
Gpos5 = bitget(G, 5+1);
Gpos4 = bitget(G, 4+1);
Gpos3 = bitget(G, 3+1);
Gpos2 = bitget(G, 2+1);
Gpos1 = bitget(G, 1+1);
Gpos0 = bitget(G, 0+1);



figure 
subplot(3, 3, 1), imshow(Gpos7*2^7)
subplot(3, 3, 2), imshow(Gpos6*2^6)
subplot(3, 3, 3), imshow(Gpos5*2^5)
subplot(3, 3, 4), imshow(Gpos4*2^4)
subplot(3, 3, 5), imshow(Gpos3*2^3)
subplot(3, 3, 6), imshow(Gpos2*2^2)
subplot(3, 3, 7), imshow(Gpos1*2^1)
subplot(3, 3, 8), imshow(Gpos0*2^0)
subplot(3, 3, 9), imshow(G)