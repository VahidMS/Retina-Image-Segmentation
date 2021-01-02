function [varargout] = probableAll(imMask,varargin)
for i = 1:nargin-1
    varargout{i} = varargin{i}/sum(varargin{i}(imMask==1));     
end

