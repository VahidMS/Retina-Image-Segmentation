function [varargout] = fakePadAll(imMask,varargin)
for i = 1:nargin-1
    varargout{i} = fakepad(varargin{i},imMask);
end