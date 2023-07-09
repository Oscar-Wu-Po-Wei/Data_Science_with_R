#getwd()
#pwd = file.path(getwd(), "FILENAME")#�Pgetwd()�P�q
getwd()
#setwd("FILEPATH")
setwd("C:/Users/oscar.wu/OneDrive/���/R/R_Dataset") ##R�����|�ݭn�ϥ�/�Ÿ�
getwd()
#install.packages("readr")
#install.packages("readxl")
library(readr)
dataset = read_delim("�ɮ׸��|�P�W��", delim="\t")
#read_delim()�Ѽƾ�z�p�U (�i��?read_delim���O�\Ū�x�軡��)�G
#file, �ɦW
#delim, ���j�Ÿ�
#quote, �����]�_�Ӫ��Ÿ�
#escape_backslash, �w�]FALSE�A�O�_��/�@���k��Ÿ�
#escape_double, �w�]TRUE�A�O�_��quote�Ÿ��@���k��Ÿ�
#col_names, �O�_�����W�١]���Y�^�]T/F�^
#col_types, �C�@����쪺���O�A�ΦV�q����
#comment, �Ƶ��ХܲŸ��A�b�Ƶ��ХܲŸ����᪺��r���|�QŪ�J
#skip, �n���L�X��H
library(readr)
dataset <- read_csv("�ɮ׸��|�P�W��")

library(readxl)
dataset <- read_excel("�ɮ׸��|�P�W��")

dataset <- readRDS("�ɮ׸��|�P�W��")
########################################################################################
#��ƿ�J�PŪ��
library(readr)
dataset = read_delim("D:/Oscar/R_Statistics/Iris_Dataset/iris.xlsx", delim="\t")
library(readxl)
dataset = read_excel("D:/Oscar/R_Statistics/Iris_Dataset/iris.xlsx")
dataset
########################################################################################
#JSON�榡�ɮ� {#json} JSON (Javascript Object Notation)�O�@�ػ��q�Ū���ƥ洫�y�� (Wiki)�A�S��p�U:
#from application programming interfaces (APIs)
#JavaScript�BJava�BNode.js����
#�@��NoSQL�D���s����Ʈw��JSON�x�s��ơGMongoDB
#����x�s�榡
##Numbers (double)
##Strings (double quoted)
##Boolean (true or false)
##Array (ordered, comma separated enclosed in square brackets [])
##Object (unorderd, comma separated collection of key:value pairs in curley brackets {})
#install.packages("jsonlite")
#�Ѹ�Ƶ��c�i���A�g�LfromJSON()��ƶפJ��JSON�ɮ׳Q��s���C��list�����A�A�B�bresult�������]�t���Ӥl����(offset, limit, count, sort, results)�A�䤤�Aresults�l���������O����Ʈ�data.frame
PetData = jsonlite::fromJSON("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c")
str(PetData)
head(PetData$result$results) #$�^�������P�l����
table(PetData$result$results$Reason)
myjson = jsonlite::toJSON(iris, pretty=TRUE) #�N��Ʈ��ഫ��JSON�ɮ�
myjson
str(myjson)
########################################################################################
#XML�i�����аO���y��
#Extensible markup language
#�y�z���c�Ƹ�ƪ��y��
#�B�zXML�ɮ׬O����Html���Ϊ���¦
#Components
##Markup �аO - labels that give the text structure
##Content ���� - the actual text of the document
#XML Wiki
#Tags, elements and attributes
##Tags correspond to general labels
###Start tags <breakfast_menu>, <price>
###End tags </breakfast_menu>,</price>
###Empty tags <line-break />
##Elements are specific examples of tags
###<name>Belgian Waffles</name>
##Attributes are components of the label
###<book category="web">
#�ϥ�XML�M��
#install.packages("XML")
#install.packages("httr")
library(XML)
library(httr)
waterQ = xmlParse(GET("https://twd.water.gov.taipei/opendata/wqb/wqb.asmx/GetQualityData")) #�ϥ�xmlParse()��ƱN�ɮ׶פJ
waterQ
str(waterQ)
#�������Ū����A�ϥ�xpathSApply()��Ʒf�tXPath�y�k���o���w���Ҥ�����ơA�̻ݨD�]�i���xpathApply()��ơA�t�O�b��xpathSApply()��Ʀ^�Ǫ�����OVector�V�q�A��xpathApply()�^�Ǫ�����OList�C���C
#�bxpathApply()�PxpathSApply()��Ƥ��A�ĤG�ӰѼƬ�XPath�AXPath�OXML���|�y���]XML Path Language�^�A���XML���𪬵��c�A���Ѧb��Ƶ��c�𤤧�M�`�I����O�C
#// �l���I���, �p�Ҧ��s������ //a
#@ �ݩʸ��, �p�Ҧ��s�����Ҥ����s�����} //a/@href
#���o�Ҧ�"code_name"���Ҥ������
xpathSApply(waterQ,"//code_name",xmlValue)[1:10]
#���o�U�ʴ������g��
xpathSApply(waterQ,"//longitude",xmlValue)[1:10]
#�ϥ�xml2�M��
#install.packages("xml2")
library(xml2)
waterURL = "https://twd.water.gov.taipei/opendata/wqb/wqb.asmx/GetQualityData"
waterQ = read_xml(waterURL) #�z�Lread_xml()��ƱNXML�ɮ׶פJ
#���o�Ҧ�"code_name"���Ҥ������
code_name_xml = xml_find_all(waterQ, ".//code_name")
code_name = xml_text(code_name_xml)
code_name[1:10]
########################################################################################
#��������(Webscraping)
URL = url("https://www.dicomstandard.org/using")
html = readLines(URL)
#html
#close(URL)
#html[1:5]
xpathSApply(html, "//title", xmlValue) #�f�tXPath�y���A�z��һݸ��
## list()
xpathSApply(html, "//span[@class='ptname ']", xmlValue)
## list()
#install.packages("rvest") #�w��rvest
library(rvest) #���Jrvest
#rvest�M��g�ѥH�U�B�J�i������ѪR�G
#�ϥ�read_html(�����^�����������}��)���Ū������
#�ϥ�html_nodes()����^���һݤ��e (����CSS��xpath����)
#�ϥ�html_text()��ƳB�z/�M�~�^�����e�A�d�U�ݭn�����
#�ϥ�html_attr()����^����ưѼơ]�p�s��url�^
YahooNewsurl = "https://tw.news.yahoo.com/"
news_title = read_html(YahooNewsurl) %>% html_nodes(".tpl-title a") %>% html_text()
news_url = read_html(YahooNewsurl) %>% html_nodes(".tpl-title a") %>% html_attr("href")
Yahoo_news = data.frame(title = news_title, url=news_url)
Yahoo_news
########################################################################################
#��ƿ�X�P�ץX
#write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ",
#            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
#            col.names = TRUE, qmethod = c("escape", "double"),
#            fileEncoding = "")
#write.csv(...)
#write.csv2(...)
#x �n�ץX���ɮסA�q�`��matrix�άOdata.frame�榡
#file �ɮצW��
#append T/F TRUE���ܦb�ɮ׫�ݥ[�J��r�AF���ܪ����л\��l�ɮ� (�w�]F)
#quote �O�_�ݭn�����޸��N�r��]�_ (�w�]T)
#sep ���j�Ÿ� (�w�]�ť�)
#eol ����Ÿ�
#na ���ܪŭȪ��r��
#dec �p���I���ܪk
#row.names T/F �O�_�ݭn��Xrow names
#col.names T/F �O�_�ݭn��Xcolumn names
#qmethod �k��r��]�w
#fileEncoding �s�X�]�w
write.table(iris,file="iris.txt",sep=",",row.names = F,col.names = T)
write.csv(iris,file="iris.csv",row.names = F)
saveRDS(iris,"iris.rds")#�bR���Ҥ��ϥ�