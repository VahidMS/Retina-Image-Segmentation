function [varargout] = makeAllBigger(scale,varargin)
for i = 1:nargin-1
    varargout{i} = double(makeImageBigger(varargin{i}, scale, scale));
end