function [iIter1 iIter2 jIter1 jIter2] = optimalInteration(imMask)
%%  Finding The First Occurance Of A NonZero Intensity In The Image
[rows cols] = find(imMask == 1);
rowIndexOfFirstNonZero = min(rows);
colIndexOfFirstNonZero = min(cols);
rowIndexOfLastNonZero = max(rows);
colIndexOfLastNonZero = max(cols);
%% Basic Loop
iIter1 = rowIndexOfFirstNonZero - 15;
iIter2 = rowIndexOfLastNonZero + 15;
jIter1 = colIndexOfFirstNonZero - 15;
jIter2 = colIndexOfLastNonZero + 15;
end

