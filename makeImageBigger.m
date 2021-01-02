function [ bigIm ] = makeImageBigger( im, yScale, xScale )
% im:  
% yScale:
% xScale:
[y x] =size(im);
bigIm = uint8(zeros(y + yScale, x + xScale));
bigIm(51:(50+y), 51:(50+x)) = im;
end

