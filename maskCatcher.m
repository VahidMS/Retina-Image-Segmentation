function [imMask] = maskCatcher(rgbIm)
%Chapter 3 from http://shodhganga.inflibnet.ac.in/handle/10603/3095
hsi = rgb2hsi(rgbIm);
I = hsi(:,:,3);
% imshow(I);
imMask = im2bw(I,.15);%.2 -->.1
imMask = medfilt2(imMask,[5 5]);
se = strel('rectangle',[5 5]);
imMask = imerode(imMask,se);
end

