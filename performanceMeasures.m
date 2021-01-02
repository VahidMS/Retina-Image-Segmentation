function measures = performanceMeasures(manual, imMask, bwIm, printIt)
% manual:
% imMask:
% bwIm:
bwIm = bwIm>0;
TP = sum(bwIm(manual > 0 & imMask == 1));%==255 --> >0
TN = sum(1 - bwIm(manual == 0 & imMask == 1));
FP = sum(bwIm(manual == 0 & imMask == 1));
FN = sum(1 - bwIm(manual > 0 & imMask == 1));

% performance with manual1
accuracy = (TP + TN)/sum(imMask(:));
sensitivity = TP/(TP+FN);
specificity = TN/(TN+FP);

measures = [TP TN FP FN accuracy sensitivity specificity];

if printIt
    fprintf('\n%d %d %d %d %.2f %.2f %.2f\n',TP ,TN ,FP ,FN ,accuracy,sensitivity,specificity);
end
end