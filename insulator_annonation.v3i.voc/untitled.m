foler2 = "test";
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
% myxml = xml_read(fullfile(xmlFiles(1).folder,xmlFiles(1).name))
