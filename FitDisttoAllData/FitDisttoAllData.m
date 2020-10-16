%Fitting Top 5 Distribution to Customer Demands%
clear
clc
close all
%%
mkdir figs
Params = containers.Map();
T = readtable('demandataevolution.xlsx');
for i = 1 : height(T)
    data = table2array(T(i,3:end));
    id = table2array(T(i,2));
    Params(sprintf('%d',id)) = fitDistfor(data,'normal','pdf');
    title_current=get(gca,'title');
    title([title_current.String, sprintf('for Customer ID %d',id)])
    pause(1)
    saveas(gcf,sprintf('./figs/%d',id),'jpeg')
    close all
end
vals = Params.values;
Paramstable = vertcat(vals{:});
