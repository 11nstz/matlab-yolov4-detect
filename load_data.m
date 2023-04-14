
data = load("trainingdata3.mat");
all_trainingdata = data.traindata;
imds = imageDatastore(all_trainingdata.Source);
blds=boxLabelDatastore(all_trainingdata(:,2:end));
train_ds=combine(imds,blds);
% all_trainingdata=data.traindata;
% a2= data2.traindata;
% train_data = all_trainingdata(1:400,:);
%text_data = all_trainingdata(401:end,:);
% imds = imageDatastore(train_data.Source);
% blds = boxLabelDatastore(train_data(:,2:end));
% train_ds = combine(imds,blds);
%imds = imageDatastore(text_data.Source);
%blds = boxLabelDatastore(text_data(:,2:end));
%text_ds = combine(imds,blds);
