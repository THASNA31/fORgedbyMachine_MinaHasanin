function params = fitDistfor(data,distName,varargin)
distname={'beta', 'birnbaumsaunders', 'exponential', ...
    'extreme value', 'gamma', 'generalized extreme value', 'poisson',...
    'generalized pareto', 'inversegaussian', 'logistic', 'loglogistic', ...
    'lognormal', 'nakagami', 'normal', 'burr', 'halfnormal', 'inversegaussian',...
    'rayleigh', 'rician', 'tlocationscale', 'weibull', 'Stable', 'uniform','all'};
assert(~isempty(data),'The input data must be defined!')
if ~isempty(distName)
    assert(isa(distName,'char'),'The distribution name must be a char!')
    assert(any(ismember(distName,distname)),'Uknown distribution name!')
else
    distName = 'normal';
end
res = allfitdist(data,'BIC',varargin{:});
params = [];
if ~strcmpi(distName,'all')
    T = struct2table(res);
    [~,loc] = checkIncell(distName,T.DistName);
    params = T.Params{loc};
end
end
function varargout = checkIncell(varargin)
%%
% Inputs:   (1) string
%           (2) cell array
%           (3) exact (optional) (defult 1)
% outputs   (1) whether exist or not
%           (2) location in the array
%%
if nargin == 2
    string = varargin{1};
    cell=varargin{2};
    exact = 1;
elseif nargin == 3
    string = varargin{1};
    cell=varargin{2};
    exact = varargin{3};
end
nocharindex = find(~cellfun(@ischar,cell));
for i = 1 : length(nocharindex)
    cell{nocharindex(i)} = 'somevalues';
end
if exact
    indx = cellfun(@(s) strcmpi(string, s), cell);
else
    indx = cellfun(@(s) contains(s, string,'IgnoreCase',true), cell);
end
    ifany = any(indx);
    loc = find(indx);
    if ~ifany
        loc = -1;
    end
    if nargout == 2
        varargout{1} = ifany;
        varargout{2} = loc;
    elseif nargout < 2
        varargout{1} = ifany;
    end
end