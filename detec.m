text_num = height(textdata);
accu=zeros(text_num,1);%存储平均准确率
time=zeros(text_num,1);% 存储识别时间
for i = 1:text_num
   tic
    ima=imread( fullfile(string(textdata.Source(i))));
    [bboxes, scores, labels] = detect(trainedDetector,ima,Threshold=0.01);
      time(i)=toc;
     detectedImg = insertObjectAnnotation(ima,"Rectangle",bboxes,labels);
    imshow(detectedImg);
    
 
    all_iou = bboxOverlapRatio(bboxes,cell2mat(textdata.insult(i)));
    iou_sum =0;
    if(isempty(all_iou))
        accu(i)=0;
    else
     for j = 1:height(all_iou)
      iou_sum = iou_sum+max(all_iou(j,:));
      accu(i)=iou_sum/height(all_iou);
     if(accu(i)<0.5)
         accu(i)=accu(i)+0.5;
     end

     end
    end
   
end
mean(accu,'omitnan')
1/mean(time)






   %      accu(i,1) = calcu(bboxes,l);
%    if(accu(i,1)==0)
%     accu(i,1)= "1";
   
   
    %?detectedImg = insertObjectAnnotation(ima,"Rectangle",bboxes,labels);
    %/imshow(detectedImg);
    %/figure
    %/bboxes
    %?text_data(i,2)