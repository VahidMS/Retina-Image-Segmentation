function [ standardIm ] = standardization( im, imMask )
imLog = log2(im+.0000000001);
meanVal = mean(imLog(imMask==1));
varianVal = std(imLog(imMask==1));
standardIm = (imLog-meanVal)/varianVal;
standardIm(imMask==0) = 0;
end

