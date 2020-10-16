function varargout = uscity10k(varargin)
%USCITY10K US cities with populations of at least 10,000 data.
%      s = uscity10k          Output all variables as structure 's'
%[x1,x2] = uscity10k          Output only first 1, 2, etc., variables
%      s = uscity10k('x',...) Output only variables 'x', ... as struct. 's'
%[x,...] = uscity10k('x',...) Output variables 'x', ... as variables
%        = uscity10k(...,is)  Output subset 'x(is)' using SUBSETSTUCT(s,is)
%                             where 'is' is vector of elements to extract
%
% Loads data file "uscity10k.mat" that contain the following variables:
%   Name = m-element cell array of m city name strings
%     ST = m-element cell array of m 2-char state abbreviations
%     XY = m x 2 matrix of city lon-lat (in decimal deg)
%    Pop = m-element vector of total population estimates (2010)
%
% Example: Extract name of all cities in North Carolina with populations
%          greater than 10,000
% NCcity = uscity10k('Name',strcmp('NC',uscity10k('ST')))
%
% %  NCcity = 'Albemarle'
% %            ...
% %           'Winston-Salem'
%                          
% (Subset of USCITY)
%
% Sources:
% [1] http://www.census.gov/geo/www/gazetteer/gazetteer2010.html
%     (file: .../gazetteer/files/Gaz_places_national.txt)
% [2] http://www.census.gov/geo/www/2010census/zcta_rel/zcta_rel.html
%     (file: .../zcta_rel/zcta_place_rel_10.txt)
%
% File [1] contains data for all incorporated places and census designated
% places (CDPs) in the 50 states, the District of Columbia and Puerto Rico
% as of the January 1, 2010. File [2] used for Pop field, and
% File [1] for all other fields.

% Copyright (c) 1994-2016 by Michael G. Kay
% Matlog Version 17 21-Jan-2016 (http://www.ise.ncsu.edu/kay/matlog)

% Input Error Checking ****************************************************
varnames = {'Name','ST','XY','Pop'};
[errstr,varargout] = loaddatafile(varargin,nargout,varnames,mfilename);
if ~isempty(errstr), error(errstr), end
% End (Input Error Checking) **********************************************
