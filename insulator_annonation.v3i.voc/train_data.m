foler1='D:/rezip/insulator_annonation.v3i.voc/train/';
imagefiles = dir(fullfile(foler1,'*.jpg'))
image_num =length(imagefiles);
Source = cell(image_num,1);
for i =1:image_num
    Source(i,1)= {fullfile(foler1,imagefiles(i).name)};
    i
end
foler2 = "train";
xmlFiles = dir(fullfile(foler2, '*.xml'));
xml_num = length(xmlFiles);
%//创建labeldata
insult = cell(xml_num,1);
for i=1:xml_num
    myxml = xml_read(fullfile(xmlFiles(i).folder,xmlFiles(i).name));
    b_num= height(myxml.object);
    for j = 1:b_num
    bndbox = myxml.object(j).bndbox;
 insult{i}=[insult{i};bndbox.xmin,bndbox.ymin,bndbox.xmax-bndbox.xmin,bndbox.ymax-bndbox.ymin];
    end    
    i
end
traindata = table(Source,insult);
