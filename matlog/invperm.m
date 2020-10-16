function inva = invperm(a)
%INVPERM Inverse permutation.
%  inva = invperm(a)
%     a = permutation vector of the integers 1 to length(a)
%
% See also RANDPERM

% Copyright (c) 1994-2016 by Michael G. Kay
% Matlog Version 17 21-Jan-2016 (http://www.ise.ncsu.edu/kay/matlog)

% Input Error Checking ****************************************************
if any(sort(a(:)') ~= 1:length(a(:)))
   error('Input argument not a permutation vector.')
end
% End (Input Error Checking) **********************************************

inva(a) = 1:length(a);
inva = reshape(inva,size(a));
