
inputSize = [416 416 3];
% trainingDataForEstimation = transform(train_ds,@(data)preprocessData(data,inputSize));
numAnchors = 8;
[anchors, meanIoU] = estimateAnchorBoxes(train_ds,numAnchors);
area = anchors(:,1).*anchors(:,2);
[~,idx] = sort(area,"descend");
anchors = anchors(idx,:);
anchorBoxes = {anchors(1:3,:);anchors(4:6,:)};
classes = {'insult'};
detector = yolov4ObjectDetector("tiny-yolov4-coco",classes,anchorBoxes,InputSize=inputSize);
epochs =200;
rate=0.0004;
options = trainingOptions("sgdm", ...`
    InitialLearnRate=rate, ...
    LearnRateSchedule="piecewise",...
    LearnRateDropFactor=0.2,...
    LearnRateDropPeriod=50,...
    MiniBatchSize=25,...
    MaxEpochs=epochs, ...
    BatchNormalizationStatistics="moving",...
    ResetInputNormalization=false,...
    Shuffle="once",...
    VerboseFrequency=30,...
    ExecutionEnvironment="gpu");
[trainedDetector,training_info] = trainYOLOv4ObjectDetector(train_ds,detector,options);
%/存储模型
time_str = datestr(now, 'mm-dd_HH');
% 构造文件名
filename = [time_str,'_detector','.mat'];
% 使用save函数将变量存储为文件
save(filename, 'trainedDetector');
filename2 = [time_str ,'_','train_info','.mat'];
save(filename2, 'training_info');