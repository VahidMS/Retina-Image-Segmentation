function [varargout] = standardAll(imMask, varargin)
for i = 1:nargin-1
    pr = varargin{i}/sum(varargin{i}(imMask==1));
    varargout{i} = standardization(pr,imMask);
end

