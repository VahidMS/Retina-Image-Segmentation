function [images] = readImages(imageIndex)
if imageIndex <=20
    imgURL = sprintf('images/%dt.tif',imageIndex);
    manual1URL = sprintf('images/%dm1t.gif',imageIndex);
    manual2URL = sprintf('images/%dm2t.gif',imageIndex); 
elseif imageIndex<=40
    imgURL = sprintf('images/%dtr.tif',imageIndex);
    manual1URL = sprintf('images/%dm1tr.gif',imageIndex);
elseif imageIndex<=60
    imgURL = sprintf('images/%dstare.tif',imageIndex);
    manual1URL = sprintf('images/%dstare.ah.tif',imageIndex);
    manual2URL = sprintf('images/%dstare.vk.tif',imageIndex);
end     
im = imread(imgURL);
manual1 = imread(manual1URL); %read manual Image 1

images = {im,manual1};
if imageIndex<=20
    manual2 = imread(manual2URL); %read manual Image 2
    images{3} = manual2;
end
if imageIndex>40
    manual2 = imread(manual2URL); %read manual Image 2
    images{3} = manual2;
end
end