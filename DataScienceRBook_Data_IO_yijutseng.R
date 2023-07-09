#getwd()
#pwd = file.path(getwd(), "FILENAME")#與getwd()同義
getwd()
#setwd("FILEPATH")
setwd("C:/Users/oscar.wu/OneDrive/文件/R/R_Dataset") ##R的路徑需要使用/符號
getwd()
#install.packages("readr")
#install.packages("readxl")
library(readr)
dataset = read_delim("檔案路徑與名稱", delim="\t")
#read_delim()參數整理如下 (可用?read_delim指令閱讀官方說明)：
#file, 檔名
#delim, 分隔符號
#quote, 把欄位包起來的符號
#escape_backslash, 預設FALSE，是否用/作為逃脫符號
#escape_double, 預設TRUE，是否用quote符號作為逃脫符號
#col_names, 是否有欄位名稱（表頭）（T/F）
#col_types, 每一個欄位的類別，用向量表示
#comment, 備註標示符號，在備註標示符號之後的文字不會被讀入
#skip, 要跳過幾行？
library(readr)
dataset <- read_csv("檔案路徑與名稱")

library(readxl)
dataset <- read_excel("檔案路徑與名稱")

dataset <- readRDS("檔案路徑與名稱")
########################################################################################
#資料輸入與讀取
library(readr)
dataset = read_delim("D:/Oscar/R_Statistics/Iris_Dataset/iris.xlsx", delim="\t")
library(readxl)
dataset = read_excel("D:/Oscar/R_Statistics/Iris_Dataset/iris.xlsx")
dataset
########################################################################################
#JSON格式檔案 {#json} JSON (Javascript Object Notation)是一種輕量級的資料交換語言 (Wiki)，特色如下:
#from application programming interfaces (APIs)
#JavaScript、Java、Node.js應用
#一些NoSQL非關連型資料庫用JSON儲存資料：MongoDB
#資料儲存格式
##Numbers (double)
##Strings (double quoted)
##Boolean (true or false)
##Array (ordered, comma separated enclosed in square brackets [])
##Object (unorderd, comma separated collection of key:value pairs in curley brackets {})
#install.packages("jsonlite")
#由資料結構可知，經過fromJSON()函數匯入的JSON檔案被轉存為列表list的型態，且在result元素中包含五個子元素(offset, limit, count, sort, results)，其中，results子元素的類別為資料框data.frame
PetData = jsonlite::fromJSON("http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c")
str(PetData)
head(PetData$result$results) #$擷取元素與子元素
table(PetData$result$results$Reason)
myjson = jsonlite::toJSON(iris, pretty=TRUE) #將資料框轉換成JSON檔案
myjson
str(myjson)
########################################################################################
#XML可延伸標記式語言
#Extensible markup language
#描述結構化資料的語言
#處理XML檔案是網頁Html爬蟲的基礎
#Components
##Markup 標記 - labels that give the text structure
##Content 內文 - the actual text of the document
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
#使用XML套件
#install.packages("XML")
#install.packages("httr")
library(XML)
library(httr)
waterQ = xmlParse(GET("https://twd.water.gov.taipei/opendata/wqb/wqb.asmx/GetQualityData")) #使用xmlParse()函數將檔案匯入
waterQ
str(waterQ)
#完成資料讀取後，使用xpathSApply()函數搭配XPath語法取得指定標籤內的資料，依需求也可改用xpathApply()函數，差別在於xpathSApply()函數回傳的物件是Vector向量，而xpathApply()回傳的物件是List列表。
#在xpathApply()與xpathSApply()函數中，第二個參數為XPath，XPath是XML路徑語言（XML Path Language），基於XML的樹狀結構，提供在資料結構樹中找尋節點的能力。
#// 子結點資料, 如所有連結標籤 //a
#@ 屬性資料, 如所有連結標籤內的連結網址 //a/@href
#取得所有"code_name"標籤內的資料
xpathSApply(waterQ,"//code_name",xmlValue)[1:10]
#取得各監測站的經度
xpathSApply(waterQ,"//longitude",xmlValue)[1:10]
#使用xml2套件
#install.packages("xml2")
library(xml2)
waterURL = "https://twd.water.gov.taipei/opendata/wqb/wqb.asmx/GetQualityData"
waterQ = read_xml(waterURL) #透過read_xml()函數將XML檔案匯入
#取得所有"code_name"標籤內的資料
code_name_xml = xml_find_all(waterQ, ".//code_name")
code_name = xml_text(code_name_xml)
code_name[1:10]
########################################################################################
#網頁爬蟲(Webscraping)
URL = url("https://www.dicomstandard.org/using")
html = readLines(URL)
#html
#close(URL)
#html[1:5]
xpathSApply(html, "//title", xmlValue) #搭配XPath語言，篩選所需資料
## list()
xpathSApply(html, "//span[@class='ptname ']", xmlValue)
## list()
#install.packages("rvest") #安裝rvest
library(rvest) #載入rvest
#rvest套件經由以下步驟進行網站解析：
#使用read_html(“欲擷取的網站網址”)函數讀取網頁
#使用html_nodes()函數擷取所需內容 (條件為CSS或xpath標籤)
#使用html_text()函數處理/清洗擷取內容，留下需要的資料
#使用html_attr()函數擷取資料參數（如連結url）
YahooNewsurl = "https://tw.news.yahoo.com/"
news_title = read_html(YahooNewsurl) %>% html_nodes(".tpl-title a") %>% html_text()
news_url = read_html(YahooNewsurl) %>% html_nodes(".tpl-title a") %>% html_attr("href")
Yahoo_news = data.frame(title = news_title, url=news_url)
Yahoo_news
########################################################################################
#資料輸出與匯出
#write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ",
#            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
#            col.names = TRUE, qmethod = c("escape", "double"),
#            fileEncoding = "")
#write.csv(...)
#write.csv2(...)
#x 要匯出的檔案，通常為matrix或是data.frame格式
#file 檔案名稱
#append T/F TRUE表示在檔案後端加入文字，F表示直接覆蓋原始檔案 (預設F)
#quote 是否需要用雙引號將字串包起 (預設T)
#sep 分隔符號 (預設空白)
#eol 換行符號
#na 表示空值的字串
#dec 小數點表示法
#row.names T/F 是否需要輸出row names
#col.names T/F 是否需要輸出column names
#qmethod 逃脫字串設定
#fileEncoding 編碼設定
write.table(iris,file="iris.txt",sep=",",row.names = F,col.names = T)
write.csv(iris,file="iris.csv",row.names = F)
saveRDS(iris,"iris.rds")#在R環境中使用