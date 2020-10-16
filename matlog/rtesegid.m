function L = rtesegid(rte)
% RTESEGID Identify shipments in each segment of route.
%     L = rtesegid(rte)
%   rte = normalized route vector
%     L = m x (2*m) logical shipment-leg matrix, where m = number of 
%         shipments in route and L(i,j) = true indicates that shipment i 
%         is in segment j

% Copyright (c) 1994-2016 by Michael G. Kay
% Matlog Version 17 21-Jan-2016 (http://www.ise.ncsu.edu/kay/matlog)

% Input Error Checking ****************************************************
checkrte(rte,[],true)
m = length(rte)/2;
if m ~= max(rte)
   error('Route not normalized (use RTENORM to normalize).')
end
% End (Input Error Checking) **********************************************

I = logical(speye(m));

L = cumsum(I(:,rte) .* repmat(2*isorigin(rte) - 1,m,1),2);
L(:,end) = [];
