%% Uppgift 1 och 2
load('huspriser55.mat')
histogram(pris)
xlabel('Pris')
ylabel('Antal')
%figure
%cdfplot(pris)

figure
probplot(pris)

dyrast = prctile(pris, 90) % 10% dyraste husen
billigast = prctile(pris,20) %20% billigaste husen

under100 = length(pris(pris<100000))/length(pris) %Hur stor andel av husen kostar mindre än 100 000 i Saratoga County
normPris = fitdist(pris, 'Normal')
xNorm = (0:.1:370000);
yNorm = normpdf(xNorm, 164583, 68267.9);
figure
plot(xNorm, yNorm)
xlabel('Pris')

%% Uppgift 3
figure
boxplot(pris,kamin)
prisUtanKamin = mean(pris(kamin<1));
prisEnKamin = mean(pris(kamin==1));
prisFlerKaminer = mean(pris(kamin>1));

%% Uppgift 3b

normPrisUtanKamin = fitdist(pris(indkamin==0), 'Normal');
normPrisKamin = fitdist(pris(indkamin==1), 'Normal');

%% Uppgift 4
addpath('reggui');
boytam2 = boyta.*0.09290304;
reggui(boytam2, pris)

%% Uppgift 5
korrelationPris = corrcoef(huspriser);

X1 = [ones(150,1) boyta bad sovrum kamin tomt alder indkamin];
[b, lb, r, r2, stats] = regress(pris, X1);
X1b = [ones(150, 1) boyta bad indkamin];
[bb, lbb, rb, r2b, statsb] = regress(pris, X1b);
X1c = [ones(150,1) boyta bad];
[bc, lbc, rc, r2c, statsc] = regress(pris, X1c);

%% Uppgift 6

X2 = [ones(150,1) boyta indkamin];
[b2, lb2, r, r2, stats2] = regress(pris, X2);


scatter3(indkamin, boyta, pris, 'filled')

xlabel('Kamin')
ylabel('Boyta')
zlabel('Pris')

