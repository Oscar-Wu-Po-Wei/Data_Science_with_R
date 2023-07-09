getwd()
setwd("C:/Users/oscar.wu/OneDrive/���/R/R_Dataset/R_Dataset_airquality")
getwd()
#��ƳB�z�P�M�~
#Tidy Data�GEach column is a variable. Each row is an observation.
#�@�����]Column�^���u���@�ӼƭȡA�̦n�n���@��ϥΪ̴N�ݱo����Column Name
#���P���[������ӭn�b���P�C�]Row�^
#�@�i���̭��A���Ҧ����R�ݭn�����
#�p�G�@�w�n�h�i���A�����@�w�n��index�i�H�����_��
#One file, one table
########################################################################################################################
#��ƫ��A�G�ƭ�(numeric)�B�r��(character)�B���L�ܼ�(logic)�Τ��(Date)��ƫ��A�C
#�ˬd�ܼƫ��O�P�U���O���ഫ�C
########################################################################################################################
#��ƫ��O�ˬd
#�ϥ�is.����ˬd��ƫ��O�A�^�ǥ��L�ܼơC
#�O�_���Ʀr is.numeric(�ܼƦW��)
#�O�_����r is.character(�ܼƦW��)
#�O�_�����L�ܼ� is.logical(�ܼƦW��)
num = 100
cha = '200'
boo = T
is.numeric(num)
is.numeric(cha)
is.character(num)
is.character(cha)
is.logical(boo)
#class(�ܼƦW��)��ơA�����^�Ǹ�ƫ��O�C
class(num)
class(cha)
class(boo)
class(Sys.Date())
########################################################################################################################
#��ƫ��O�ഫ�B�z
#as.����ഫ���O
#�ഫ���Ʀras.numeric(�ܼƦW��)
#�ഫ����ras.character(�ܼƦW��)
#�ഫ�����L�ܼ�as.logical(�ܼƦW��)
cha2 = as.numeric(cha)
boo2 = as.numeric(boo)
num2 = as.character(num)
as.character(boo)
#�Y�L�k���Q�����ഫ�A�|�^�Ǫŭ�NA�A�åX�{ĵ�i�T��Warning: NAs introduced by coercion�AWarning: �j���ܧ�L�{�����ͤF NA�C
########################################################################################################################
#������ഫ�G��ĳ�ϥ�lubridate�M��
#�p�G�Q�n�N�~/��/��榡����r�ഫ���������A�i�ϥ�ymd()��ơ]y���~year�Am����month�Ad����day�^�C
#�p�G�Q�n�N��/��/�~�榡����r�ഫ���������A�h�ϥ�mdy()��ơ]y���~year�Am����month�Ad����day�^�C
##install.packages("lubridate")
library(lubridate)
ymd('2021/3/3')
mdy('3/3/2021')
########################################################################################################################
#��r�r��B�z
#���� strsplit()
#�l�� substr()
#�j�p�g�ഫ toupper() tolower()
#���r�s�� paste() paste0()
#��r���N gsub()
#�e��ťեh�� str_trim()�A�ݦw��stringr�M��A�PPython��strip()�P�\�C
strsplit ("Hello World"," ")
toupper("Hello World")
tolower("Hello World")
paste("Hello", "World", sep='')
substr("Hello World", start=2,stop=4)#�r���^������
gsub("o","0","Hello World")#�r����N
##install.packages("stringr")
library(stringr)
str_trim(" Hello World ")
########################################################################################################################
#�j�M�r��
#�j�M�r���Ƴq�`�ϥΦb����r�V�q�A��r��靈���j�p�g�A�̷Ӧ^�ǭȪ����A���P�A����ر`�Ψ�ơAgrep()�Pgrepl():
#grep(�j�M����,���j�M���V�q)�G�^�ǲŦX���󤧦V�q��m(Index)
#grepl(�j�M����,���j�M���V�q)�G�^�ǨC�ӦV�q�O�_�ŦX����(TRUE or FALSE)
grep("A",c("Alex","Tom","Amy","Joy","Emma")) ##�b�m�W��r�V�q���M��A�A�^�ǥ]�t"A"��������m
## [1] 1 3
grepl("A",c("Alex","Tom","Amy","Joy","Emma")) ##�b�m�W��r�V�q���M��A�A�^�ǦU�����O�_�]�t"A"
## [1]  TRUE FALSE  TRUE FALSE FALSE
grepl("a",c("Alex","Tom","Amy","Joy","Emma")) ##�b�m�W��r�V�q���M��a�A�^�ǦU�����O�_�]�t"a"
## [1] FALSE FALSE FALSE FALSE  TRUE
########################################################################################################################
#���W���F��
##�y�k	���W���F��
##���	[0-9]+
##�B�I��	[0-9]+.[0-9]+	58.15
##�­^��r��	[A-Za-z]+
##Email	[a-zA-Z0-9_]+@[a-zA-Z0-9._]+
##URL	http://[a-zA-Z0-9./_]+
#�i�Υ��W���ܦ���R��Ʀp�U�G
##grep()
##grepl()
##gsub()
##str_split()
##stringr package�����Ѧh���
#���W���ܦ��`�λy�k�����p�U�G
##�k��r��
##���ܼƶq
##���ܦ�m
##�B��l
##�S���Ÿ�
#�k��r��
#���ܡu�ƶq�v���y�k########################################################################################################
# *: �X�{0~�L���h��
# +: �X�{1~�L���h��
# ?: �X�{0~1��
# {n}: �X�{n��
# {n,}: �X�{n~�L���h��
# {n,m}: �X�{n~m��
stringVector = c("a","abc","ac","abbc","abbbc","abbbbc")
grep("ab*",stringVector,value=T)
## [1] "a"      "abc"    "ac"     "abbc"   "abbbc"  "abbbbc"
grep("ab+",stringVector,value=T)
## [1] "abc"    "abbc"   "abbbc"  "abbbbc"
grep("ab?c",stringVector,value=T)
## [1] "abc" "ac"
grep("ab{2}c",stringVector,value=T)
## [1] "abbc"
grep("ab{2,}c",stringVector,value=T)
## [1] "abbc"   "abbbc"  "abbbbc"
grep("ab{2,3}c",stringVector,value=T)
## [1] "abbc"  "abbbc"
#���ܡu��m�v���y�k########################################################################################################
# ^ �X�{�b�r��}�l����m
# $: �X�{�b�r�굲��������m
# \b: �X�{�Ŧr��(�ť�)�}�l�ε�������m
# \B: �X�{�D�r��}�l�ε�������m
stringVector = c("abc","bcd","cde","def","abc def","bcdefg abc")
grep("^bc",stringVector,value=T)
## [1] "bcd"        "bcdefg abc"
grep("bc$",stringVector,value=T)
## [1] "abc"        "bcdefg abc"
grep("\\bde",stringVector,value=T)
## [1] "def"     "abc def"
grep("\\Bde",stringVector,value=T)
## [1] "cde"        "bcdefg abc"
#�B��l##################################################################################################################
# .: �X�{�Ҧ����r���@���A�]�A�Ŧr��
# [...]: �X�{�r���M��(�K)�����r���@���A�i��-���ܽd��A�p[A-Z]�A[a-z]�A[0-9]
# [^...]: ���X�{�r���M��(�K)�����r��
# \: �n�j�M�r�ꤤ���S���r���ɡA�e�趷�[�W\
# |: ��
stringVector = c("03-2118800","02-23123456","0988123456",
                "07-118","0-888","csim@mail.cgu.edu.tw","csim@.","csim@",
                "http://www.is.cgu.edu.tw/")
grep("[0-9]{2}-[0-9]{7,8}",stringVector,value=T)
## [1] "03-2118800"  "02-23123456"
grep("[0-9]{10}",stringVector,value=T)
## [1] "0988123456"
grep("02|03",stringVector,value=T)
## [1] "03-2118800"  "02-23123456"
grep("[a-zA-Z0-9_]+@[a-zA-Z0-9._]+",stringVector,value=T)
## [1] "csim@mail.cgu.edu.tw" "csim@."
#�S���Ÿ�################################################################################################################
# \d: �Ʀr�A���� [0-9]
# \D: �D�Ʀr�A���� [^0-9]
# [:lower:]: �p�g�r�A���� [a-z]
# [:upper:]: �j�g�r�A���� [A-Z]
# [:alpha:]: �Ҧ��^��r�A���� [[:lower:][:upper:]] or [A-z]
# [:alnum:]: �Ҧ��^��r�M�Ʀr�A���� [[:alpha:][:digit:]] or [A-z0-9]
# \w: ��r�Ʀr�P���u�A���� [[:alnum:]_] or [A-z0-9_]
# \W: �D��r�Ʀr�P���u�A���� [^A-z0-9_]
# [:blank:]: �ťզr���A�]�A�ťթMtab
# \s: �ťզr��, 
# \S: �D�ťզr��
# [:punct:]: ���I�Ÿ� ! " # $ % & �� ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.
stringVector<-c("03-2118800","02-23123456","0988123456",
                "07-118","0-888","csim@mail.cgu.edu.tw","http://www.is.cgu.edu.tw/")
grep("\\d{2}-\\d{7,8}",stringVector,value=T)
## [1] "03-2118800"  "02-23123456"
grep("\\d{10}",stringVector,value=T)
## [1] "0988123456"
grep("\\w+@[a-zA-Z0-9._]+",stringVector,value=T)
## [1] "csim@mail.cgu.edu.tw"
#�l��Subset#############################################################################################################
#�@�����(�V�q)
letters
letters[1] ##���Xletters�V�q���Ĥ@�Ӥ���
## [1] "a"
letters[1:10] ##���Xletters�V�q���e�Q�Ӥ���
##  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
letters[c(1,3,5)] ##���Xletters�V�q����1,3,5�Ӥ���
## [1] "a" "c" "e"
letters[c(-1,-3,-5)] ##���Xletters�V�q���F��1,3,5�Ӥ������~���Ҧ�����
##  [1] "b" "d" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v"
## [20] "w" "x" "y" "z"
#�Y�Q�n�ֳt���o�@�V�q���}�Y�P���������A�i�ϥ�head()�Mtail()���
head(letters,5) ##���Xletters�V�q���e���Ӥ���
## [1] "a" "b" "c" "d" "e"
tail(letters,3) ##���Xletters�V�q����T�Ӥ���
## [1] "x" "y" "z"
#�G�����
#�̱`�����G����Ƭ�data.frame��ƮءA�G����ƥi�w��C(Row)�M��(Column)���l���A�l����ܤ覡�@�ˬO�ϥ�[]�A
#���]���G����ƪ��ݨD�A�H,���j�C�P�檺�z�����A��ƿz���h���eRow,��Column�A�e�C,���A�Y���Q�z��C�A�h�b,�e��O���ťէY�i�C
#�z��覡�i��J��m(index)�B���W�٩ο�J���L�ܼ�(TRUE/FALSE)
#��J��m: dataFrame[row index,column index]
#��J���L�ܼ�: dataFrame[c(T,F,T),c(T,F,T)]
#��J���W��: dataFrame[row name,column name]
data(iris)
iris
iris[1,2] ##�Ĥ@�CRow�A�ĤG��Column
iris[1:3,] ##��1~3�CRow�A�Ҧ�����Column
iris[,"Species"] ##�Ҧ����CRow�A�W�٬�Species����Column
iris$Species ##�P�W��P�q�A�ϥ�$�Ÿ���Column���z��A�Ҧ����CRow�A�W�٬�Species����Column
iris[1:10,c(T,F,T,F,T)] ##��1~10�CRow�A��1,3,5��Column (TRUE)
#Row���z��i�ϥ�subset()��ơA�ϥΤ�k��subset(��ƪ�,�z���޿�)
subset(iris,Species=="virginica") ##Species����"virginica"���CRow�A�Ҧ�����Column
#Row���z��]�i�f�t�r��j�M���grepl()
##install.packages("knitr")
knitr::kable(iris[grepl("color",iris$Species),]) ##Species�]�t"color"���C�A�Ҧ�����
#�ֳt���o��Ʈت��e�X�C(Row)�Ϋ�X�C�A�ϥ�head()�Mtail()���
head(iris,5) ##���Xiris��Ʈت��e���C
tail(iris,3) ##���Xiris��Ʈت���T�C
#sort �V�q�ƧǡG������V�q���Ѥp��j���Ƨ�
head(islands) ##�Ƨǫe���e�������
head(sort(islands)) ##�Ѥp��j�Ƨǫ᪺�e�������
head(sort(islands,decreasing = T)) ##�Ѥj��p�Ƨǫ᪺�e������ơA�Ndecreasing�ѼƳ]��TRUE
sort(iris$Sepal.Length)
#order ��ƮرƧǡG�^�ǥѤp��j��������m�C
#�Hiris$Sepal.Length���ҡA�^�Ǫ��Ĥ@�Ӧ�m��14�A����iris$Sepal.Length���A�ƭȳ̤p����������14�Ӥ����C
order(iris$Sepal.Length)
iris$Sepal.Length[14]
#�Ndecreasing�ѼƳ]�w��TRUE�A�^�ǥѤj��p��������m�A�Hiris$Sepal.Length���ҡA�^�Ǫ��Ĥ@�Ӧ�m��132�A����iris$Sepal.Length���A�ƭȳ̤j����������132�Ӥ����C
order(iris$Sepal.Length,decreasing = T)
iris$Sepal.Length[132]
head(iris) ##�Ƨǫe���e�������
head(iris[order(iris$Sepal.Length),]) ##�̷�Sepal.Length���ƭȤj�p�Ƨǫ᪺�e�������#�̷�order�^�Ǫ�������m�A���s�Ƨ�iris��Ʈ�
head(iris[order(iris$Sepal.Length,decreasing=T),]) ##�̷�Sepal.Length���ƭȤj�p�Ƨǫ᪺�e�������#�̷�order�^�Ǫ�������m�A���s�Ƨ�iris��Ʈ�
#��ƲզX�G�ݭn�b��Ʈطs�W�@�C�A�ηs�W�@��A�i�H�Q�θ�ƲզX��Ƨ����C
##Row �C���զX rbind()
##Column �檺�զX cbind()
rbind(c(1,2,3), #�Ĥ@�C
      c(4,5,6)) #�ĤG�C
irisAdd = rbind(iris, #��Ʈ�
          c(1,1,1,1,"versicolor"))  #�s�W�@�C
tail(irisAdd)
cbind(c(1,2,3), #�Ĥ@�C
      c(4,5,6)) #�ĤG�C
irisAdd = cbind(iris, #��Ʈ�
          rep("Add",nrow(iris)))  #�s�W�@��(���Ƥ��eAdd,���Ʀ��Ʈھ�iris��Ƥ����nrow)
tail(irisAdd)
#��Ƶ��X(Join)##########################################################################################################
#���F���Ӧ�C���Ǫ��զX�~�A��`�������άO�̷ӬY����쪺"��"�@�����X�̾�
#merge()��ƱN��Ʈص��X�Gmerge(��Ʈ�1,��Ʈ�2,by="���X�̾����")
nameDF = data.frame(ID=c(1,2,3,4,5),Name=c("Amy","Bob","Chris","David","Emma"))
scoreDF = data.frame(ID=c(1,2,4),Score=c(60,90,50))
merge(nameDF,scoreDF,by="ID")
#merge��ƹw�]�u�O�d���Ʈس��������쪺��ơA�p�G���Q�nmerge��ƱN�S�����쪺��ƧR���A�i�H�]�w�Ѽ�all�Aall.x�άOall.y�A�ӫO�d�S�����쪺��ƦC�C
##merge(��Ʈ�1,��Ʈ�2,by="���X�̾����",all=T)
##merge(��Ʈ�1,��Ʈ�2,by="���X�̾����",all.x=T)
##merge(��Ʈ�1,��Ʈ�2,by="���X�̾����",all.y=T)
merge(nameDF,scoreDF,by="ID",all=T)
#dplyr�M�󴣨ѧ󦳮Ĳv����Ƶ��X��k�A�]�A:
##inner_join()�G�O�d�������쪺��ơFinner_join(x, y, by = )�C
##left_join()�G�O�d�����Ʈت��Ҧ���ơFleft_join(x, y, by = )�C
##right_join()�G�O�d�k���Ʈت��Ҧ���ơFright_join(x, y, by = )�C
##full_join()�G�O�d�Ҧ���ơFfull_join(x, y, by = )�C
##semi_join()�G�d�U���䪺ID�]���X�{�b�k�䪺�����C�A�k����Ƥ��|��X�Fsemi_join(x, y, by = )�C
##anti_join()�C
##install.packages("dplyr")
library(dplyr) #�ϥΫe�������J�M��
inner_join(nameDF,scoreDF,by="ID")
left_join(nameDF,scoreDF,by="ID")
right_join(nameDF,scoreDF,by="ID")
full_join(nameDF,scoreDF,by="ID")
#�����P�e��###############################################################################################################
#�b��ƳB�z���L�{���A�`�]�U�ػݨD�A�ݭn������e���������ʧ@�A�bR�����ܦn�Ϊ��M��reshape2�A���ѧ��㪺�ഫ�\��A�̱`�ϥΡG
##�e��������Gmelt(��Ʈ�/�e��,id.vars=�ݭn�O�d�����)
##������e���Gdcast(��Ʈ�/����,�e�����C�̾�~�����̾�)
#install.packages("reshape2")
library(reshape2)
head(airquality)
#install.packages("melt")#�ݭn�f�treshape2
library(melt)
airqualityM = melt(airquality,id.vars = c("Month","Day")) ##��lairquality��Ʈؤ��A��Ozone, Solar.R, Wind, Temp, Month, Day��������� (Column)�A�ݩ�e���A�O�dMonth�MDay������A�ñN��L��쪺�W�پ�X��variable���A�ƭȾ�X��value���A���e��������C
airqualityM ##�ഫ�L������airqualityM��Ʈؤ��A�ѤUMonth, Day, variable, value���|�����(Column)�A�ݩ�����C
head(airqualityM)
airqualityCast = dcast(airqualityM, Month+Day~variable) ##���O�d"Month","Day"�~�A��L���ƥإ�variable�w�q
head(airqualityCast)
#tidyverse�M��ժ�tidyr###################################################################
#�e������� gather(��Ʈ�/�e��,key="�D�����W��",value="�ƭ����W��",�n�ഫ�����1,�n�ഫ�����2,...)
#������e�� spread(��Ʈ�/����,key="�n�i�}�����W��",value="�ƭ����W��")
#�P�W�A�Hairquality��Ʈج��ҡA��Ӫ�airquality��Ʈؤ��A��Ozone, Solar.R, Wind, Temp, Month, Day��������� (Column)�A�ݩ�e���C
airquality
#install.packages("tidyr")
library(tidyr)
airqualityL = gather(airquality, key=Type, value=Value, Ozone, Solar.R, Wind, Temp) ##���Ozone,Solar.R,Wind,Temp�ন��@���
airqualityL
write.csv(airqualityL,file="airqualityL.csv", row.names = T)
#�ഫ�L������airqualityL��Ʈؤ��A�ѤUMonth, Day, Type, Value���|����� (Column)�A�ݩ�����C
airqualityW = spread(airqualityL, key=Type, value=Value) ##���O�d"Month","Day"�~�A��L����variable�w�q
write.csv(airqualityW,file="airqualityW.csv", row.names = T)
airqualityW
#��|�ȳB�z###############################################################################################################
#��|��(Missing Value)�`�`�X�{�b�u���Ƥ��A�b�ƭȹB��ɱ`�|�����D�A��²�檺��k�O�N���ʭȪ���Ʋ����A�p��Ƭ��V�q�A�i�ϥ�is.na()�ӧP�_��ƬO�_���ŭ�NA�A�Y���uTRUE�A�h�N��Ʋ����C
naVec = c("a", "b", NA, "d", "e")
is.na(naVec)
naVec[is.na(naVec)]
naVec[!is.na(naVec)] ##�O�d�Ҧ��bis.na()�ˬd�^��FALSE������(�O�d���Ȫ�����)
#�Y��ƫ��A����ƮءA�i�ϥ�complete.cases�ӿ�X���㪺��ƦC�A�p�G��ƦC�O���㪺�A�h�|�^��TRUE�C
complete.cases(airquality)
airquality[complete.cases(airquality)==T,] ##�u���airquality�����㪺��ƦC(rows)�C
airquality[,complete.cases(airquality)==T] ##���~�o�ͦb `[.data.frame`(airquality, , complete.cases(airquality) == T)�G��ܤF���w�q����C
#install.packages("SportsAnalytics")
library(SportsAnalytics)
NBA1516 = fetch_NBAPlayerStatistics("15-16") ##�Q�ήM�󤺴��Ѫ�fetch_NBAPlayerStatistics()��ơA�N�����~������ƨ��X�C
NBA2021 = fetch_NBAPlayerStatistics("20-21") ##�Q�ήM�󤺴��Ѫ�fetch_NBAPlayerStatistics()��ơA�N�����~������ƨ��X�C
NBA2122 = fetch_NBAPlayerStatistics("21-22") ##���~�׶i�椤����Ʃ|������A�����C
NBA1516
NBA2021
str(NBA1516) ##��ƨ��X��A�i��str()����`��NBA1516�o��"��Ʈ�(data.frame)"��"���"�P"������O"�C
NBA1516$Name
NBA1516$Position
length(NBA1516) ##length()��ܸ�Ʈت��ܼ�(���ƶq,variables)
head(NBA1516)
tail(NBA1516)
NBA1516OrderG = NBA1516[order(NBA1516$GamesPlayed, decreasing=T),]
NBA1516OrderG
NBA1516OrderG[1:5,] ##�r���e���1~5�A���ܨ�1~5�C�F�r�����ťաA���ܭn���Ҧ����C
NBA1516OrderM = NBA1516[order(NBA1516$TotalMinutesPlayed, decreasing=T),]
NBA1516OrderM
NBA1516OrderM[1:10,"Name"] ##�r���e���1~10�C�F�r������"Name"�A���ܨ��W�٬�Name�����C
#���ȿz��(�ϥ�������z��)
subset(NBA1516, Team=="BOS")
subset(NBA2021, Team=="LAL")
NBA1516[grepl("James", NBA1516$Name),] ##���X�r��j�M���grepl()�A�N�Ҧ��W�r�̦�"James"���y����ƨ��X�C