function [S] = lineOperator(grayIm, imMask, lines,...
    isLineDetectionInWeberSpace, isLineDetectionUsesPreProcessing, iIter1,...
    iIter2, jIter1, jIter2)
%% Pre Processing or Not
if isLineDetectionInWeberSpace
    grayIm = WeberTransform(grayIm);
end
if isLineDetectionUsesPreProcessing
    grayIm = adapthisteq(grayIm, 'cliplimit',0.01,'numtiles',[10 10]...
        , 'Range', 'original');%Must be with optimised Parameters
end

if isLineDetectionInWeberSpace == 1
    grayIm = WeberTransform(double(grayIm));
end

nl = length(lines{1});
%%  Finding The First Occurance Of A NonZero Intensity In The Image
% [iIter1 iIter2 jIter1 jIter2] = optimalInteration(imMask);
S = zeros(size(grayIm));
    maxL = -Inf*ones(size(grayIm));
    maxN = zeros(size(grayIm));
maxS = -Inf*ones(size(grayIm));
for k=1:12
    lineMask = lines{k};
    Nblock = lineMask;
    Nblock(Nblock~=0) = 1;
%     Nblock(:,:) = 1;
    lineMask(lineMask~=1) = 0;
    lineMask = lineMask/sum(lineMask(:));
    L = imfilter(grayIm,full(lineMask));
    NMask = Nblock/sum(Nblock(:));
    N = imfilter(grayIm,full(NMask));
    
        LT = L - maxL;
        maxL = max(L,maxL);
        maxN(LT>0) = N(LT>0);
%     S = L-N;
%     maxS = max(S,maxS);
end
    S = maxL-maxN;
% S = maxS;

% for i = iIter1:iIter2 
%     for j = jIter1:jIter2        
%         if imMask(i,j)
%             block = grayIm(i-floor(nl/2):i+floor(nl/2),j-floor(nl/2):j+floor(nl/2));
%             L = 0;           
%             for k = 1:12
%                 LTemp = mean(block(lines{k} == 1));
%                 if L <= LTemp
%                     L = LTemp;
%                     selectedOrientation = lines{k};
%                 end
%             end
%             N = mean(block(selectedOrientation ~= 0));
%             S(i,j) = L-N;
%         end
%     end
% end
