function [ scaledIm ] = scaleTo255( im )
scaledIm = im * 255 / max(im(:));
end

