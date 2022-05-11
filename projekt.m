%Detta blir pog
load('huspriser55.mat')
hist(pris)
cdfplot(pris)
billigast = prctile(pris, 90) % 10% dyraste husen
dyrast = prctile(pris,20) %20% billigaste husen
under100 = length(pris(pris<100000))/length(pris) %Hur stor andel av husen kostar mindre än 100 000 i Saratoga County