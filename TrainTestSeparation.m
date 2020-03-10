function [trainx,trainy,testx,testy]=TrainTestSeparation(datax,datay,r1,r2)
sdx=size(datax);
a1=transpose(randi([1,50],round((r1/(r1+r2))*sdx(1)/3),1));       %a1 is a column vector of size based on given ratios and have values between 1 to 50 
a2=transpose(randi([51,100],round((r1/(r1+r2))*sdx(1)/3),1));     %a2 is a column vector of size based on given ratios and have values between 51 to 100
a3=transpose(randi([101,150],round((r1/(r1+r2))*sdx(1)/3),1));    %a3 is a column vector of size based on given ratios and have values between 101 to 150
a=[a1;a2;a3];             %we can directly do randi([1,150],round((r1/(r1+r2))*sdx),1) but this will not insure that equal amount of data values are selected from 'setosa','verginica'and 'versicolor'    
b=transpose(randperm(150)); % a coloumn matrix containg randomly permutated values from 1 to 150
b=setdiff(b,a);       % this will convert b into a coloumn vector containg values ot present in a i.e not in trainx 
trainx=datax(a,:);
testx=datax(b,:);     % assigning values to all the output variables using a and b
trainy=datay(a,:);
testy=datay(b,:);