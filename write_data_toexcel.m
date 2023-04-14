gap =20;
l=length(training_info.TrainingLoss)/gap;
tloss = zeros(l,1);

for i = 1:l
    tloss(i,1)=training_info.TrainingLoss(1,i*gap);
end
filename = 'traininglossdata.xlsx';
writematrix(tloss,filename,"Sheet",1,'Range','d1');
