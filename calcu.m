function max_acc = calcu(bboxes,label)
label_box= cell2mat(label);
s1= label_box(1,3)*label_box(1,4);%/标注面积
xmin1 = label_box(1,1);
xmax1 = label_box(1,1)+label_box(1,3);
ymin1 = label_box(1,2);
ymax1 = label_box(1,2)+label_box(1,4);
detext_box=bboxes;
max_acc =0;%/最大精确率
for i = 1 :height(detext_box)  
xweight= min(xmax1,detext_box(i,1)+detext_box(i,3))...
-max(xmin1,detext_box(i,1));
yhight = min(ymax1,detext_box(i,2)+detext_box(i,4))...
    -max(ymin1,detext_box(i,2));
max_acc = max(max_acc,(xweight*yhight/s1));
end
end
