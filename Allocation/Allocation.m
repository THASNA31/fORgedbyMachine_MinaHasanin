% Allocating Cusomers to Distribution Nodes %
clear
clc
close all
%% Gettng Data
DS1 = readtable('Node location.csv'); DS2 = readtable('ZIP CODE.csv');
DS3 = readtable('demandataevolution.xlsx');
DS1= table2struct(DS1); DS2= table2struct(DS2); 
XY_EF = [[DS1.LON]' [DS1.LAT]']; XY_DC= XY_EF(1:7,:);
N_DC = {DS1.nodeName}; N_DC=convertCharsToStrings(N_DC); N_DC=N_DC';
ZIP_C = [DS2.ZIP]; 
XY_C=uszip5('XY',mand(ZIP_C,uszip5('Code5')));
%% Allocation
m=length(ZIP_C); n=length(XY_DC);
D=mydist(XY_DC,XY_C);
a=argmin(D); 
%Create Allocation Table
for i=1:m
    DC(i)=N_DC(a(i));
end
Alloctable=DS3;
Alloctable = addvars(Alloctable,DC','After','Customer','NewVariableNames','AllocatedDC');
%% Demand Pooling
%Create Demand Correlation Matrix at each DC
Params=[];
for j=1:n
    W{j}=table2array(Alloctable(a==j,4:end));
    Dcorr{j}=corrcoef(W{j}');
    DP{j}=sum(W{j});
    Params(j,:)=fitDistfor(DP{j},'normal','pdf');
    title_current=get(gca,'title');
    title([title_current.String, sprintf('for %s',N_DC(j))])
    pause(1)
    saveas(gcf,sprintf('./figs/%s',N_DC(j)),'jpeg')
    close all
end
Params
% Write table
DCLable = 0:6;
DCLable = DCLable';
Mean = Params(:,1);
Sigma = Params(:,2);
T = table(DCLable,Mean,Sigma);
writetable(T,'DC_demand.csv')
writetable(Alloctable,'AllocationTable.csv')





