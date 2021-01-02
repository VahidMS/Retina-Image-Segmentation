if arbitrary == 1
    im = imread(imgURL);
    greenIm = im(:,:,2);imMask = maskCatcher(im);
else

    ims = readImages(i);
    im = ims{1};
    manual1 = ims{2};
    if i<=20 || i>40
        manual2 = ims{3};
    end
end
greenIm = im(:,:,2);imMask = maskCatcher(im);
greenIm(imMask == 0) = 0;greenImC = imcomplement(im(:,:,2));
greenImC(imMask == 0) = 0;
%% Make Images Bigger and Fak Padding 
if arbitrary == 1
    [greenIm,greenImC,imMask] = ...
        makeAllBigger(100,greenIm,greenImC,imMask);
else
    [greenIm,greenImC,imMask,manual1] = ...
        makeAllBigger(100,greenIm,greenImC,imMask,manual1);
    if i<=20 || i>40
        manual2 = makeAllBigger(100,manual2);
    end
end

if isFakePadUsed == 1
    [greenIm,greenImC] = fakePadAll(imMask,greenIm,greenImC);
end
%%
greenIm = mat2gray(greenIm);
greenImC = mat2gray(greenImC);
imMask = mat2gray(imMask);
greenIm = scaleTo255(greenIm);
greenImC = scaleTo255(greenImC);
%%
figure
imshow(imMask)
input('Hi','s')
[y,x] = size(greenIm);
