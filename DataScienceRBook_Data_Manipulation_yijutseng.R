getwd()
setwd("C:/Users/oscar.wu/OneDrive/文件/R/R_Dataset/R_Dataset_airquality")
getwd()
#資料處理與清洗
#Tidy Data：Each column is a variable. Each row is an observation.
#一個欄位（Column）內只有一個數值，最好要有一般使用者就看得懂的Column Name
#不同的觀察值應該要在不同列（Row）
#一張表裡面，有所有分析需要的資料
#如果一定要多張表，中間一定要有index可以把表串起來
#One file, one table
########################################################################################################################
#資料型態：數值(numeric)、字串(character)、布林變數(logic)及日期(Date)資料型態。
#檢查變數型別與各型別的轉換。
########################################################################################################################
#資料型別檢查
#使用is.函數檢查資料型別，回傳布林變數。
#是否為數字 is.numeric(變數名稱)
#是否為文字 is.character(變數名稱)
#是否為布林變數 is.logical(變數名稱)
num = 100
cha = '200'
boo = T
is.numeric(num)
is.numeric(cha)
is.character(num)
is.character(cha)
is.logical(boo)
#class(變數名稱)函數，直接回傳資料型別。
class(num)
class(cha)
class(boo)
class(Sys.Date())
########################################################################################################################
#資料型別轉換處理
#as.函數轉換型別
#轉換為數字as.numeric(變數名稱)
#轉換為文字as.character(變數名稱)
#轉換為布林變數as.logical(變數名稱)
cha2 = as.numeric(cha)
boo2 = as.numeric(boo)
num2 = as.character(num)
as.character(boo)
#若無法順利完成轉換，會回傳空值NA，並出現警告訊息Warning: NAs introduced by coercion，Warning: 強制變更過程中產生了 NA。
########################################################################################################################
#日期的轉換：建議使用lubridate套件
#如果想要將年/月/日格式的文字轉換為日期物件，可使用ymd()函數（y表年year，m表月month，d表日day）。
#如果想要將月/日/年格式的文字轉換為日期物件，則使用mdy()函數（y表年year，m表月month，d表日day）。
##install.packages("lubridate")
library(lubridate)
ymd('2021/3/3')
mdy('3/3/2021')
########################################################################################################################
#文字字串處理
#切割 strsplit()
#子集 substr()
#大小寫轉換 toupper() tolower()
#兩文字連接 paste() paste0()
#文字取代 gsub()
#前後空白去除 str_trim()，需安裝stringr套件，與Python之strip()同功。
strsplit ("Hello World"," ")
toupper("Hello World")
tolower("Hello World")
paste("Hello", "World", sep='')
substr("Hello World", start=2,stop=4)#字串擷取切割
gsub("o","0","Hello World")#字串取代
##install.packages("stringr")
library(stringr)
str_trim(" Hello World ")
########################################################################################################################
#搜尋字串
#搜尋字串函數通常使用在比對文字向量，文字比對有分大小寫，依照回傳值的型態不同，有兩種常用函數，grep()與grepl():
#grep(搜尋條件,欲搜尋的向量)：回傳符合條件之向量位置(Index)
#grepl(搜尋條件,欲搜尋的向量)：回傳每個向量是否符合條件(TRUE or FALSE)
grep("A",c("Alex","Tom","Amy","Joy","Emma")) ##在姓名文字向量中尋找A，回傳包含"A"之元素位置
## [1] 1 3
grepl("A",c("Alex","Tom","Amy","Joy","Emma")) ##在姓名文字向量中尋找A，回傳各元素是否包含"A"
## [1]  TRUE FALSE  TRUE FALSE FALSE
grepl("a",c("Alex","Tom","Amy","Joy","Emma")) ##在姓名文字向量中尋找a，回傳各元素是否包含"a"
## [1] FALSE FALSE FALSE FALSE  TRUE
########################################################################################################################
#正規表達式
##語法	正規表達式
##整數	[0-9]+
##浮點數	[0-9]+.[0-9]+	58.15
##純英文字串	[A-Za-z]+
##Email	[a-zA-Z0-9_]+@[a-zA-Z0-9._]+
##URL	http://[a-zA-Z0-9./_]+
#可用正規表示式的R函數如下：
##grep()
##grepl()
##gsub()
##str_split()
##stringr package中的諸多函數
#正規表示式常用語法分類如下：
##逃脫字元
##表示數量
##表示位置
##運算子
##特殊符號
#逃脫字元
#表示「數量」的語法########################################################################################################
# *: 出現0~無限多次
# +: 出現1~無限多次
# ?: 出現0~1次
# {n}: 出現n次
# {n,}: 出現n~無限多次
# {n,m}: 出現n~m次
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
#表示「位置」的語法########################################################################################################
# ^ 出現在字串開始的位置
# $: 出現在字串結束ˇ的位置
# \b: 出現空字串(空白)開始或結束的位置
# \B: 出現非字串開始或結束的位置
stringVector = c("abc","bcd","cde","def","abc def","bcdefg abc")
grep("^bc",stringVector,value=T)
## [1] "bcd"        "bcdefg abc"
grep("bc$",stringVector,value=T)
## [1] "abc"        "bcdefg abc"
grep("\\bde",stringVector,value=T)
## [1] "def"     "abc def"
grep("\\Bde",stringVector,value=T)
## [1] "cde"        "bcdefg abc"
#運算子##################################################################################################################
# .: 出現所有的字元一次，包括空字串
# [...]: 出現字元清單(…)中的字元一次，可用-表示範圍，如[A-Z]，[a-z]，[0-9]
# [^...]: 不出現字元清單(…)中的字元
# \: 要搜尋字串中的特殊字元時，前方須加上\
# |: 或
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
#特殊符號################################################################################################################
# \d: 數字，等於 [0-9]
# \D: 非數字，等於 [^0-9]
# [:lower:]: 小寫字，等於 [a-z]
# [:upper:]: 大寫字，等於 [A-Z]
# [:alpha:]: 所有英文字，等於 [[:lower:][:upper:]] or [A-z]
# [:alnum:]: 所有英文字和數字，等於 [[:alpha:][:digit:]] or [A-z0-9]
# \w: 文字數字與底線，等於 [[:alnum:]_] or [A-z0-9_]
# \W: 非文字數字與底線，等於 [^A-z0-9_]
# [:blank:]: 空白字元，包括空白和tab
# \s: 空白字元, 
# \S: 非空白字元
# [:punct:]: 標點符號 ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.
stringVector<-c("03-2118800","02-23123456","0988123456",
                "07-118","0-888","csim@mail.cgu.edu.tw","http://www.is.cgu.edu.tw/")
grep("\\d{2}-\\d{7,8}",stringVector,value=T)
## [1] "03-2118800"  "02-23123456"
grep("\\d{10}",stringVector,value=T)
## [1] "0988123456"
grep("\\w+@[a-zA-Z0-9._]+",stringVector,value=T)
## [1] "csim@mail.cgu.edu.tw"
#子集Subset#############################################################################################################
#一維資料(向量)
letters
letters[1] ##取出letters向量的第一個元素
## [1] "a"
letters[1:10] ##取出letters向量的前十個元素
##  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
letters[c(1,3,5)] ##取出letters向量的第1,3,5個元素
## [1] "a" "c" "e"
letters[c(-1,-3,-5)] ##取出letters向量除了第1,3,5個元素之外的所有元素
##  [1] "b" "d" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v"
## [20] "w" "x" "y" "z"
#若想要快速取得一向量的開頭與結尾元素，可使用head()和tail()函數
head(letters,5) ##取出letters向量的前五個元素
## [1] "a" "b" "c" "d" "e"
tail(letters,3) ##取出letters向量的後三個元素
## [1] "x" "y" "z"
#二維資料
#最常見的二維資料為data.frame資料框，二維資料可針對列(Row)和行(Column)做子集，子集選擇方式一樣是使用[]，
#但因應二維資料的需求，以,分隔列與行的篩選條件，資料篩選原則為前Row,後Column，前列,後行，若不想篩選列，則在,前方保持空白即可。
#篩選方式可輸入位置(index)、欄位名稱或輸入布林變數(TRUE/FALSE)
#輸入位置: dataFrame[row index,column index]
#輸入布林變數: dataFrame[c(T,F,T),c(T,F,T)]
#輸入欄位名稱: dataFrame[row name,column name]
data(iris)
iris
iris[1,2] ##第一列Row，第二行Column
iris[1:3,] ##第1~3列Row，所有的行Column
iris[,"Species"] ##所有的列Row，名稱為Species的行Column
iris$Species ##與上行同義，使用$符號做Column的篩選，所有的列Row，名稱為Species的行Column
iris[1:10,c(T,F,T,F,T)] ##第1~10列Row，第1,3,5行Column (TRUE)
#Row的篩選可使用subset()函數，使用方法為subset(資料表,篩選邏輯)
subset(iris,Species=="virginica") ##Species等於"virginica"的列Row，所有的行Column
#Row的篩選也可搭配字串搜尋函數grepl()
##install.packages("knitr")
knitr::kable(iris[grepl("color",iris$Species),]) ##Species包含"color"的列，所有的行
#快速取得資料框的前幾列(Row)或後幾列，使用head()和tail()函數
head(iris,5) ##取出iris資料框的前五列
tail(iris,3) ##取出iris資料框的後三列
#sort 向量排序：直接對向量做由小到大的排序
head(islands) ##排序前的前六筆資料
head(sort(islands)) ##由小到大排序後的前六筆資料
head(sort(islands,decreasing = T)) ##由大到小排序後的前六筆資料，將decreasing參數設為TRUE
sort(iris$Sepal.Length)
#order 資料框排序：回傳由小到大之元素位置。
#以iris$Sepal.Length為例，回傳的第一個位置為14，表示iris$Sepal.Length中，數值最小的元素為第14個元素。
order(iris$Sepal.Length)
iris$Sepal.Length[14]
#將decreasing參數設定為TRUE，回傳由大到小的元素位置，以iris$Sepal.Length為例，回傳的第一個位置為132，表示iris$Sepal.Length中，數值最大的元素為第132個元素。
order(iris$Sepal.Length,decreasing = T)
iris$Sepal.Length[132]
head(iris) ##排序前的前六筆資料
head(iris[order(iris$Sepal.Length),]) ##依照Sepal.Length欄位數值大小排序後的前六筆資料#依照order回傳的元素位置，重新排序iris資料框
head(iris[order(iris$Sepal.Length,decreasing=T),]) ##依照Sepal.Length欄位數值大小排序後的前六筆資料#依照order回傳的元素位置，重新排序iris資料框
#資料組合：需要在資料框新增一列，或新增一行，可以利用資料組合函數完成。
##Row 列的組合 rbind()
##Column 行的組合 cbind()
rbind(c(1,2,3), #第一列
      c(4,5,6)) #第二列
irisAdd = rbind(iris, #資料框
          c(1,1,1,1,"versicolor"))  #新增一列
tail(irisAdd)
cbind(c(1,2,3), #第一列
      c(4,5,6)) #第二列
irisAdd = cbind(iris, #資料框
          rep("Add",nrow(iris)))  #新增一行(重複內容Add,重複次數根據iris資料之行數nrow)
tail(irisAdd)
#資料結合(Join)##########################################################################################################
#除了按照行列順序的組合外，更常有的情形是依照某個欄位的"值"作為結合依據
#merge()函數將資料框結合：merge(資料框1,資料框2,by="結合依據欄位")
nameDF = data.frame(ID=c(1,2,3,4,5),Name=c("Amy","Bob","Chris","David","Emma"))
scoreDF = data.frame(ID=c(1,2,4),Score=c(60,90,50))
merge(nameDF,scoreDF,by="ID")
#merge函數預設只保留兩資料框都有對應到的資料，如果不想要merge函數將沒對應到的資料刪除，可以設定參數all，all.x或是all.y，來保留沒對應到的資料列。
##merge(資料框1,資料框2,by="結合依據欄位",all=T)
##merge(資料框1,資料框2,by="結合依據欄位",all.x=T)
##merge(資料框1,資料框2,by="結合依據欄位",all.y=T)
merge(nameDF,scoreDF,by="ID",all=T)
#dplyr套件提供更有效率的資料結合方法，包括:
##inner_join()：保留有對應到的資料；inner_join(x, y, by = )。
##left_join()：保留左邊資料框的所有資料；left_join(x, y, by = )。
##right_join()：保留右邊資料框的所有資料；right_join(x, y, by = )。
##full_join()：保留所有資料；full_join(x, y, by = )。
##semi_join()：留下左邊的ID也有出現在右邊的表的列，右表資料不會輸出；semi_join(x, y, by = )。
##anti_join()。
##install.packages("dplyr")
library(dplyr) #使用前須先載入套件
inner_join(nameDF,scoreDF,by="ID")
left_join(nameDF,scoreDF,by="ID")
right_join(nameDF,scoreDF,by="ID")
full_join(nameDF,scoreDF,by="ID")
#長表與寬表###############################################################################################################
#在資料處理的過程中，常因各種需求，需要執行長寬表互換的動作，在R中有很好用的套件reshape2，提供完整的轉換功能，最常使用：
##寬表轉長表：melt(資料框/寬表,id.vars=需要保留的欄位)
##長表轉寬表：dcast(資料框/長表,寬表分列依據~分欄位依據)
#install.packages("reshape2")
library(reshape2)
head(airquality)
#install.packages("melt")#需要搭配reshape2
library(melt)
airqualityM = melt(airquality,id.vars = c("Month","Day")) ##原始airquality資料框中，有Ozone, Solar.R, Wind, Temp, Month, Day等六個欄位 (Column)，屬於寬表，保留Month和Day兩個欄位，並將其他欄位的名稱整合至variable欄位，數值整合至value欄位，為寬表轉長表。
airqualityM ##轉換過的長表airqualityM資料框中，剩下Month, Day, variable, value等四個欄位(Column)，屬於長表。
head(airqualityM)
airqualityCast = dcast(airqualityM, Month+Day~variable) ##欄位保留"Month","Day"外，其他欄位數目由variable定義
head(airqualityCast)
#tidyverse套件組的tidyr###################################################################
#寬表轉長表 gather(資料框/寬表,key="主鍵欄位名稱",value="數值欄位名稱",要轉換的資料1,要轉換的資料2,...)
#長表轉寬表 spread(資料框/長表,key="要展開的欄位名稱",value="數值欄位名稱")
#同上，以airquality資料框為例，原來的airquality資料框中，有Ozone, Solar.R, Wind, Temp, Month, Day等六個欄位 (Column)，屬於寬表。
airquality
#install.packages("tidyr")
library(tidyr)
airqualityL = gather(airquality, key=Type, value=Value, Ozone, Solar.R, Wind, Temp) ##欄位Ozone,Solar.R,Wind,Temp轉成單一欄位
airqualityL
write.csv(airqualityL,file="airqualityL.csv", row.names = T)
#轉換過的長表airqualityL資料框中，剩下Month, Day, Type, Value等四個欄位 (Column)，屬於長表。
airqualityW = spread(airqualityL, key=Type, value=Value) ##欄位保留"Month","Day"外，其他欄位由variable定義
write.csv(airqualityW,file="airqualityW.csv", row.names = T)
airqualityW
#遺漏值處理###############################################################################################################
#遺漏值(Missing Value)常常出現在真實資料內，在數值運算時常會有問題，最簡單的方法是將有缺值的資料移除，如資料為向量，可使用is.na()來判斷資料是否為空值NA，若為真TRUE，則將資料移除。
naVec = c("a", "b", NA, "d", "e")
is.na(naVec)
naVec[is.na(naVec)]
naVec[!is.na(naVec)] ##保留所有在is.na()檢查回傳FALSE的元素(保留有值的元素)
#若資料型態為資料框，可使用complete.cases來選出完整的資料列，如果資料列是完整的，則會回傳TRUE。
complete.cases(airquality)
airquality[complete.cases(airquality)==T,] ##只顯示airquality中完整的資料列(rows)。
airquality[,complete.cases(airquality)==T] ##錯誤發生在 `[.data.frame`(airquality, , complete.cases(airquality) == T)：選擇了未定義的行。
#install.packages("SportsAnalytics")
library(SportsAnalytics)
NBA1516 = fetch_NBAPlayerStatistics("15-16") ##利用套件內提供的fetch_NBAPlayerStatistics()函數，將對應年份之資料取出。
NBA2021 = fetch_NBAPlayerStatistics("20-21") ##利用套件內提供的fetch_NBAPlayerStatistics()函數，將對應年份之資料取出。
NBA2122 = fetch_NBAPlayerStatistics("21-22") ##今年度進行中之資料尚不完整，報錯。
NBA1516
NBA2021
str(NBA1516) ##資料取出後，可用str()函數總覽NBA1516這個"資料框(data.frame)"的"欄位"與"欄位類別"。
NBA1516$Name
NBA1516$Position
length(NBA1516) ##length()顯示資料框的變數(欄位數量,variables)
head(NBA1516)
tail(NBA1516)
NBA1516OrderG = NBA1516[order(NBA1516$GamesPlayed, decreasing=T),]
NBA1516OrderG
NBA1516OrderG[1:5,] ##逗號前方放1~5，表示取1~5列；逗號後方空白，表示要取所有欄位。
NBA1516OrderM = NBA1516[order(NBA1516$TotalMinutesPlayed, decreasing=T),]
NBA1516OrderM
NBA1516OrderM[1:10,"Name"] ##逗號前方取1~10列；逗號後方放"Name"，表示取名稱為Name之欄位。
#欄位值篩選(使用欄位條件篩選)
subset(NBA1516, Team=="BOS")
subset(NBA2021, Team=="LAL")
NBA1516[grepl("James", NBA1516$Name),] ##結合字串搜尋函數grepl()，將所有名字裡有"James"的球員資料取出。