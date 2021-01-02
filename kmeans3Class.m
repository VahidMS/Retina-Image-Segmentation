function [diffDark diffBack diffBright] = kmeans3Class(grayIm, imMask,...
    kmeansError,iskmeansUsesPreProcessing, iskmeansInWeberSpace,...
    illuminationI)
%% Pre Processing
if iskmeansUsesPreProcessing == 1
    grayIm = illuminationEqualizationPaper1(im2uint8(grayIm),...
        illuminationI,illuminationI);
    
%     grayIm = adapthisteq(grayIm, 'cliplimit',0.01,'numtiles',[10 10]...
%         , 'Range', 'original');%Must be with optimised Parameters
end
if iskmeansInWeberSpace == 1
    grayIm = WeberTransform(double(grayIm));
end

%% K-Means
diffBack = zeros(size(grayIm)); % difference from background Center
diffDark = zeros(size(grayIm)); % difference from vessels Center
diffBright = zeros(size(grayIm)); % difference from Bright parts Center

FOVMean = mean(grayIm(imMask == 1));
FOVStd = std(double(grayIm(imMask == 1)));

cDark = FOVMean - FOVStd;
cBack = FOVMean;
cBright = FOVMean + FOVStd;

oldcBack = cBack + 1;
oldcDark = cDark + 1;
oldcBright = cBright + 1;

FOVIntesities = grayIm(imMask == 1);
%% Basic Loop
while abs(oldcDark - cDark) > kmeansError || abs(oldcBack - cBack) > kmeansError || abs(oldcBright - cBright) > kmeansError   
    clear iDark iBack iBright;
    distanceDark = abs(double(FOVIntesities) - double(cDark));
    distanceBack = abs(double(FOVIntesities) - double(cBack));
    distanceBright = abs(double(FOVIntesities) - double(cBright));
    
    iDark = FOVIntesities(distanceDark < distanceBack & distanceDark < distanceBright);
    iBack = FOVIntesities(distanceBack < distanceDark & distanceBack < distanceBright);
    iBright = FOVIntesities(distanceBright < distanceBack & distanceBright < distanceDark);
    
    oldcDark = cDark;
    oldcBack = cBack;
    oldcBright = cBright;
    
    cDark = mean(iDark);
    cBack = mean(iBack);
    cBright = mean(iBright);
end
%% Distances

diffBack(imMask == 1) = abs(double(double(grayIm(imMask == 1))...
    - double(cBack))); 
diffDark(imMask == 1) = abs(double(double(grayIm(imMask == 1))...
    - double(cDark)));
diffBright(imMask == 1) = -(double(double(grayIm(imMask == 1))...
    - double(cBright))); 
diffBright(diffBright<0) = 0;