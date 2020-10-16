function deletelntag()
%DELETELNTAG Delete last tagged line objects from plot.
% deletelntag()
%
% Executes commands:
%    s = get(gca,'UserData');
%    delete(findobj(s.LastLineTag))
%    projtick

% Copyright (c) 1994-2016 by Michael G. Kay
% Matlog Version 17 21-Jan-2016 (http://www.ise.ncsu.edu/kay/matlog)

% Input Error Checking ****************************************************
% End (Input Error Checking) **********************************************

s = get(gca,'UserData');
if isstruct(s) && isfield(s,'LastLineTag')
   delete(findobj('Tag',s.LastLineTag))
   projtick
end     
