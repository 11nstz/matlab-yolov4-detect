foler1='D:/rezip/insulator_annonation.v3i.voc/test/';
imagefiles = dir(fullfile(foler1,'*.jpg'))
image_num =length(imagefiles);
Source = cell(image_num,1);
for i =1:image_num
    Source(i,1)= {fullfile(foler1,imagefiles(i).name)};
    i
end
% foler2 = "train";
% xmlFiles = dir(fullfile(foler2, '*.xml'));
% xml_num = length(xmlFiles)
% %//创建labeldata
% insult = cell(xml_num,1);
% for i=1:xml_num
%     myxml = xml_read(fullfile(foler2,xmlFiles(i).name));
%     bndbox = myxml.object.bndbox;
%     insult{i}=[bndbox.xmin,bndbox.ymin,bndbox.xmax-bndbox.xmin,bndbox.ymax-bndbox.ymin];
%     i
% end
% traindata = table(Source,insult);