# fORgedbyMachine_MinaHasanin
This repository contains the abstract, codes, and result tables for the fORged by Machines contest 2020, submitted by:
1. Tanzid Hasnain
2. Mina Mohammadi

Here is a description of the codes in this repository.

<b>File Name: FitDisttoAllData.m</b><br>
Description: This code finds the top five distributions fitted to demand data in all zip codes. <br>
Input file(s): demandataevolution.xlsx<br>
Output file(s): *zip*.JPEG files stored in \figs <br>
Required File(s): fitDistfor.m, allfitdist.m <br>

<b>File Name: Allocation.m</b> <br>
Description: This code allocates customer zip codes to 7 distribution centers based on minimum distance. 
In other words, customers are assigned to the closest distribution center. 
For each distribution center, a normal distribution is fitted to the aggregated demand. 
Since the correlation between allocated demands to each distribution center is positive, aggregating demand reduces the variability and is more favorable in our model.<br>
Input file(s): Node location.csv, ZIP CODE.csv, demandataevolution.xlsx <br>
Output file(s): AllocationTable.csv, DC_demand.csv <br>
Required File(s): matlog package, mydist.m, fitDistfor.m, allfitdist.m <br>

<b>File Name: Phase-1 model.ipynb</b><br>
Description: This python code block solves the phase-1 model and generates the optimal FTL and LTL number of packages. 
This code calculates cost of missing demand and cost of inequity for the optimal number of packages.
The LTL packages are read into a csv file, which is fed into the Phase-2 or the VRP model discussed in the following section. 
This code also takes the output of the Vehicle Routing Problem or VRP model and calculates the cost of distributing the number 
of packages for the independent shipments and the routes. This code block also calculates cost of distribution for the optimal
number of packages generated from Phase 1 when rounded up to the nearest integer. This cost provides the decision makers with a 
choice: they can either solve both phase 1 and 2 models or they can round up the number of trucks required to distribute the 
optimal number of packages generated from phase 1 for a calculated cost increase. The tradeoff here is between the computational 
complexity of VRP and the increased cost of distribution.<br>
Input file(s): Distancematrix.csv, DC_Demand.csv<br>
Output file(s): FTL_output, FTL_WC_output<br>

<b>File Name: VRP.m</b><br>
Description: This code takes the LTL (Less Than Truck Load) shipment values for 50 lanes (output of phase 1 of the model) 
and solves the Vehicle Routing Problem. The output of this code the optimal set of consolidated and independent routes. <br>
Input file(s): Nodelocation.csv, VRPinput.csv <br>
Output file(s): VRPoutput.csv <br>
Required File(s): matlog package, mydist.m <br>


## The solutions can be found in the “Final Tables” folder.




