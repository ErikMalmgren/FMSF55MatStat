%% Uppgift 1 och 2
load('huspriser55.mat')
histogram(pris)
%figure
%cdfplot(pris)

dyrast = prctile(pris, 90) % 10% dyraste husen
billigast = prctile(pris,20) %20% billigaste husen

under100 = length(pris(pris<100000))/length(pris) %Hur stor andel av husen kostar mindre än 100 000 i Saratoga County
normPris = fitdist(pris, 'Normal')
xNorm = (0:.1:370000);
yNorm = normpdf(xNorm, 164583, 68267.9);
figure
plot(xNorm, yNorm)

%% Uppgift 3
figure
boxplot(pris,kamin)
prisUtanKamin = mean(pris(kamin<1))
prisEnKamin = mean(pris(kamin==1))
prisFlerKaminer = mean(pris(kamin>1))

%% Uppgift 3b

normPrisUtanKamin = fitdist(pris(indkamin==0), 'Normal')
normPrisKamin = fitdist(pris(indkamin==1), 'Normal')

%% Uppgift 4
addpath('reggui');

reggui(boyta, pris)