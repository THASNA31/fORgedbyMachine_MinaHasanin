% Vehicle Routing Problem%
clear
clc
close all
%% Loading Data
DS = readtable('Nodelocation.csv'); 
DS= table2struct(DS);
XY_EF= [[DS.LON]' [DS.LAT]'];
D=mydist(XY_EF,XY_EF);
DS1=readmatrix('VRPinput.csv'); Net=DS1;
SHR= adj2list(Net); %Shipment Routes
f=SHR(:,3); %Shimpemt Quantity
%% Create Shipments
tr = struct('r',2,'Kwt',1000,'Kcu',2000);
sh1 = vec2struct('b',SHR(:,1),'e',SHR(:,2),'q',f,'s',1000); %check a
sh1 = vec2struct(sh1,'d',diag(D([sh1.b],[sh1.e])));
%% Construct & improve all feasible routes:
rTDh = @(rte) rteTC(rte,sh1,D,tr);
ph = @(rte) plotshmt(sh1,XY_EF,rte,tr);
IJS = pairwisesavings(rTDh,sh1);
[r1,TD1] = twoopt(savings(rTDh,sh1,IJS,ph),rTDh,ph);
[rc,idx1,~] = sh2rte(sh1,r1,rTDh);
%% Plot
pplot(XY_EF(1,:),'ks')
plotshmt(sh1,XY_EF,rc,tr)
%% Display route output structure
[TC1,Xflg1,out1] = rTDh(rc);
for i = 1:length(out1), sdisp(out1(i),false,i), end
%% Output
Wt = cellfun(@(r)sum(f(rte2idx(r))),rc);
vdisp('Wt,TC1')
TCh= @(d) (100+2*d);
for i=1:length(rc)
   idx=rte2idx(rc{i});
   N(i)=ceil(Wt(i)/1000);
   Totcost(i)=TCh(rTDh(rc{i}))*ceil(Wt(i)/1000);
   Arc{i}=out1(i).Loc;
end
T=table(transpose(N),transpose(Wt),TC1,transpose(Totcost),transpose(Arc),'VariableNames',{'TruckPerRoute','PackageNumber','DistancePerRoute','CostPerRoute','Arc'});
cd 'F:\NCSU\Semesters\3rd Semester\Contests\VRP\Output'
writetable(T,'VRPoutput.csv')

