text_num = height(textdata);
accu=zeros(text_num,1);%存储平均准确率
time=zeros(text_num,1);% 存储识别时间
box_storage=zeros(text_num,2);
for i = 1:text_num
    ima=imread( fullfile(string(textdata.Source(i))));
      tic
    [bboxes, scores, labels] = detect(trainedDetector,ima,Threshold=0.01);
      time(i)=toc;
      label_box = cell2mat(textdata.insult(i));     
      box_storage(i,2)=height(label_box);
%      detectedImg = insertObjectAnnotation(ima,"Rectangle",bboxes,labels);
%     imshow(detectedImg);
   
    iou_matrix = bboxOverlapRatio(bboxes,label_box);
    iou_sum =0;
    if(isempty(iou_matrix))
        accu(i)=0;
    else
       
     for j = 1:width(iou_matrix)
      iou_sum = iou_sum+max(iou_matrix(:,j));
      if(isempty(iou_matrix(:,j)))
          box_storage(i,1)=box_storage(i,1)+0;
      else
          box_storage(i,1)=box_storage(i,1)+1;
      end
      accu(i)=iou_sum/width(iou_matrix);
%      if(accu(i)<0.5)
%          accu(i)=accu(i)+0.5;
%      end

     end
    end   
end
detect_num_persent = mean(box_storage(:,1))/mean(box_storage(:,2))
mean_iou=  mean(accu)
fps=1/mean(time)






   %      accu(i,1) = calcu(bboxes,l);
%    if(accu(i,1)==0)
%     accu(i,1)= "1";
   
   
    %?detectedImg = insertObjectAnnotation(ima,"Rectangle",bboxes,labels);
    %/imshow(detectedImg);
    %/figure
    %/bboxes
    %?text_data(i,2)