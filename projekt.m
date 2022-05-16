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
prisUtanKamin = mean(pris(kamin<1));
prisEnKamin = mean(pris(kamin==1));
prisFlerKaminer = mean(pris(kamin>1));

%% Uppgift 3b

normPrisUtanKamin = fitdist(pris(indkamin==0), 'Normal');
normPrisKamin = fitdist(pris(indkamin==1), 'Normal');

%% Uppgift 4
addpath('reggui');

reggui(boyta, pris)

%% Uppgift 5
korrelationPris = corrcoef(huspriser);

X1 = [ones(150,1) boyta bad sovrum kamin tomt alder indkamin];
[b, lb, r, r2, stats] = regress(pris, X1);

%% Uppgift 6

X2 = [ones(150,1) boyta indkamin];
[b2, lb2, r, r2, stats2] = regress(pris, X2);
b3 = regress(pris, X2);


scatter3(indkamin, boyta, pris, 'filled')

indkaminfit = min(indkamin):100:max(indkamin);
boytafit = min(boyta):100:max(boyta);
[indkaminfit, boytafit] = meshgrid(indkaminfit, boytafit);
prisfit = b3(1) + b3(2)*indkaminfit + b3(3)*boytafit + b3(4)*indkaminfit.*boytafit;
mesh(indkaminfit, boytafit, prisfit)
xlabel('Kamin')
ylabel('Boyta')
zlabel('Pris')

