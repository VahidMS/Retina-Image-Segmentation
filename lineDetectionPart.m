%% Only Line Detection Part of the main Method
%% Line Detection Paper 34
% lines = makeLineOperatorsAutomatic([3 5 7 11 13 15 17 19]);
lines = makeLineOperatorsAutomatic([5 11 15]);
[iIter1 iIter2 jIter1 jIter2] = optimalInteration(imMask);

% S = zeros(size(newIm));
for p=1:length(lines)
    Snew = lineOperator(newIm, imMask,lines{p}, 0,0, iIter1,...
        iIter2, jIter1, jIter2);
    ST{p} = Snew;
end
S = ST{1} + ST{2} + ST{3};
[SPr] = probableAll(imMask,S);
[stS] = standardAll(imMask,S);
bS = stS > .77;
