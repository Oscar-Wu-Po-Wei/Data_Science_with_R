#探索式資料分析 (Exploratory Data Analysis) 的主要精神是運用視覺化、基本的統計等工具，反覆的探索資料特性，獲取資料所包含的資訊、結構和特點，
#因為在進行複雜或嚴謹的分析之前，必須要對資料有更多認識，才能訂定對的資料分析方向。

#探索式資料分析包括分析各變數間的關聯性，看是否有預料之外的有趣發現，或是觀察資料內容是否符合預期，
#若否，檢查資料是否有誤，最後檢查資料是否符合分析前的假設，由上述可知，探索式資料分析通常不需要嚴謹的假設和細節呈現，主要功能還是『觀察』資料的特性。
#在資料量大或雜的時候，探索式資料分析就非常重要，因為透過探索式資料分析，分析人員可以在複雜的統計計算與耗時的模型建立前，就先發現可能的錯誤，
#更重要的是，可以透過探索性分析來調整分析的方向，減少因分析方向錯誤所造成的時間浪費。

#探索式資料分析分為:
##圖形化Graphical 或 量化Quantitative
##單變量Univariate 或 雙變量Bivariate 或 多變量Multivariate
#圖形化的分析方式包括做圖與列表，量化的分析方式則是資料初步統計，本模組著重於量化的分析方式，圖形化的分析方式請參考Visualization。

#以單變量分析來說，量化的分析方式可包含：
##計算集中趨勢 (維基百科)
###平均值 Mean mean()
###中位數 Median median()
###眾數 Mode，R無內建函數，可直接用table()找出現次數最多的資料
##計算資料分散程度
###最小值 Min min()
###最大值 Max max()
###範圍 Range range()
###四分位差 Quartiles quantile()
###變異數 Variance var()
###標準差 Standard deviation sd()

#以雙變量分析來說，分析方式可包括:
##列聯表 Crosstabs table(), ftable(), prop.table()
##共變數 Covariance cov()
##相關性 Correlation cor()

#量化分析方式的測量值大多可用R的內建函數完成計算，但是在探索式分析時，常常需要遇到資料分組的分析情形，
#若只用基本的內建函數計算，需要先完成資料分組或子集後，再作進一步的運算，相當耗時，為了使這類資料分組與分析的工作更容易被完成，
#本書在介紹探索式資料分析時會搭配介紹data.table和dplyr packages，
#這兩個packages各有優點，可依個人適合性選用。

#data.table#############################################################################################################
#data.table讀取大型資料的速度比使用data.frame快上數倍。
#install.packages("data.table")
library("data.table") ##載入
#fread("FILENAME") ##讀取資料函數
library("SportsAnalytics")
library("data.table")
NBA1516 = fetch_NBAPlayerStatistics("15-16")
NBA1516DT = data.table(NBA1516) ##NBA1516為data.frame
class(NBA1516)
class(NBA1516DT) ##"data.table" "data.frame"
#轉換後的NBA1516DT資料型態為data.table以及data.frame，
#這是因為data.table是data.frame資料框型別的延伸，
#所以只要是data.table型態的資料，就一定同時會是data.frame型態。

#data.table資料型態具有特殊結構和語法設計，利於後續資料分析處理，基本語法結構如下：
#DT[i,j,by=]
##i  觀察值(Row)篩選邏輯
##j  所需欄位(Column)
##by 分組依據
#各參數間需要以逗號,區隔，但若只需使用前方參數，後方的,可省略，如只需使用i和j兩個參數，可以寫成DT[i,j]。各參數的使用方法分述如下：
#i 觀察值篩選邏輯
##第一個參數i是用來篩選觀察值，也就是針對列(Row)做子集。
##篩選方式可透過布林值的向量或是元素索引(index)向量指定篩選條件，透過觀察值的篩選，可保留需要的資料，進行後續分析。
NBA1516DT[grepl('James',Name)]
NBA1516DT[grepl("A",Name)&Position=="C"]
str(NBA1516DT)
NBA1516DT[GamesPlayed>80] ##完整表示法：NBA1516DT[NBA1516$GamesPlayed>80]
#j 欄位選擇運算
##第二個參數j是用來決定輸出欄位，輸出的欄位可以是原始欄位，也可以是計算後的欄位。
NBA1516DT[,mean(GamesPlayed)] ##因為沒有篩選需求，逗號前方留空。
NBA1516DT[,.(mean(GamesPlayed),mean(PersonalFouls),mean(Steals))] ##一次計算多個數值，此時第二個欄位j需要使用.()包起來。
##    V1  V2 V3
## 1: 55 105 41
##輸出的數字自動被加上欄位名稱V1, V2, V3
#在計算新欄位時，可以在新欄位定義的前方加上欄位名稱=，同時替欄位取名字，如下：
NBA1516DT[,.(GamesPlayedMean=mean(GamesPlayed),
             PersonalFoulsMean=mean(PersonalFouls),
             StealsMean=mean(Steals))]
NBA1516DT[,.(GamesPlayedMax=max(GamesPlayed), ##最大值
             ThreesMadeMin=min(ThreesMade), ##最小值
             FieldGoalsMadeSD=sd(FieldGoalsMade))] ##標準差
NBA1516DT[GamesPlayed>70,.(ThreesMadeMean=mean(ThreesMade),FieldGoalsMadeMean=mean(FieldGoalsMade))] ##計算出所有出場數大於70的球員，平均投進幾顆三分球與兩分球。
#by 分組依據
##第三個參數by為分組計算的依據，舉例來說，我們可以計算NBA各隊的球員數與平均助攻數，
##球員個數的計算在data.table內可使用.N指令，平均使用mean()函數，此時只要在by=後方加上分組依據(各隊Team)，即可完成運算。
NBA1516DT[,.(.N,AssistsMean=mean(Assists)),by=Team] ##.N在data.table內是保留字，用來計算個數。
NBA1516DT[Position=="C",.(.N,ThreesAttemptedMean=mean(ThreesAttempted)),by=Team]

#dplyr##################################################################################################################
#dplyr使用以下函數分析整理資料：
## select(): 選要分析的欄位，欄位子集 (Column)
## filter(): 選要分析的觀察值，觀察值子集 (Row)
## mutate(): 增加新欄位
## summarise(): 計算統計值
## group_by(): 分組依據 ##同功於DT[,,by=]
## arrange(): 觀察值排序
## rename(): 欄位重新命名
## %>%: the “pipe” operator 連結上數函式，將所有函式計算串在一起執行
#install.packages("dplyr") ##安裝
library(dplyr) ##載入
library(SportsAnalytics)
NBA1516 = fetch_NBAPlayerStatistics("15-16")
#select()
##使用select()函式可選要分析的欄位，也就是針對欄位(Column)做子集。
##函式使用方式為select(資料名稱,欄位條件1,欄位條件2,...)，其中條件1與條件2是使用或的連結概念。
##另外dplyr提供幾個方便篩選名稱的函式：
## starts_with()
## ends_with()
## contains()
## matches()
## num_range()
## one_of()
## everything()
#詳細說明可在R執行視窗中輸入?select_helpers查看。
select1 = select(NBA1516,Name,starts_with("Threes"),starts_with("FieldGoals"))
##等同於
##select1 = NBA1516[,c("Name","ThreesMade","ThreesAttempted","FieldGoalsMade","FieldGoalsAttempted")] ##篩選欄位
head(select1)
select2 = select(NBA1516,Name:FreeThrowsAttempted) ##用:串連欄位名稱，篩選欄位Name到欄位FreeThrowsAttempted間的所有欄位。
##等同於NBA1516[,2:12]
head(select2)
select3<-select(NBA1516,Name:FreeThrowsAttempted,-GamesPlayed) ##用-移除欄位名稱GamesPlayed。
##等同於NBA1516[,c(2:4,6:12)]
head(select3)
#filter()
##使用filter()函式可選要分析的觀察值，也就是針對列(Row)做子集，使用方法為filter(資料名稱,篩選條件)
filter1 = filter(NBA1516,TotalMinutesPlayed>2850) ##篩選出場分鐘數超過2850分鐘的球員資料。
##等同於
filter1 = NBA1516[NBA1516$TotalMinutesPlayed>2850,] ##篩選列
#A %in% B：A 是否在 B 中。
filter2 = filter(NBA1516,Team %in% c("BOS","SAN")) ##配對運算 (Matching operator, binary, in model formulae: nesting)
head(filter2)
filter3 = filter(NBA1516,FieldGoalsMade/FieldGoalsAttempted>0.7)
filter3
#可使用 &(與)、|(或)等符號串連邏輯篩選條件。
filter4 = filter(NBA1516,FieldGoalsMade/FieldGoalsAttempted>0.7 & GamesPlayed>30)
filter4
#summarise()：用來計算統計值
summary1 = summarise(NBA1516,
                     Player_number=n(),                    ##球員個數
                     Team_number=n_distinct(Team),         ##不重複隊伍數
                     Position_type=n_distinct(Position))   ##不重複球員位置數
summary1
filter1 = filter(NBA1516,TotalMinutesPlayed>2500)
filter1
summary2 = summarise(filter1,
                     Player_number=n(),
                     FieldGoalsMadeMean=mean(FieldGoalsMade),
                     FieldGoalsAttemptedMean=mean(FieldGoalsAttempted))
summary2
#上述分析流程（先篩選再總和），可直接用pipe符號%>%將指令串連，減少暫存物件（filter1）的生成，主要概念是"先篩選後計算"。
summary3=filter(NBA1516,TotalMinutesPlayed>2500) %>%
         summarise(Player_number=n(),
                   FieldGoalsMadeMean=mean(FieldGoalsMade),
                   FieldGoalsAttemptedMean=mean(FieldGoalsAttempted))
summary3
#group_by()：設定分組依據，同功於DT[,,by=]，通常會與summarise()函式合併使用。
group1 = group_by(NBA1516,Team) %>% summarise(Player_number=n(),FieldGoalsMadeMean=mean(FieldGoalsMade),FieldGoalsAttemptedMean=mean(FieldGoalsAttempted))
#計算各隊（以Team作為分組依據）的球員數、平均投進的兩分球數以及平均投出的兩分球數。
group1
# `summarise()` regrouping output by 'Team' (override with `.groups` argument)
head(group1)
group2 = group_by(NBA1516,Team,Position) %>% summarise(Player_number=n(),FieldGoalsMadeMean=mean(FieldGoalsMade),FieldGoalsAttemptedMean=mean(FieldGoalsAttempted))
head(group2)
#arrange()：排序功能，預設為遞增排序。
arrange1 = arrange(NBA1516,TotalMinutesPlayed)
head(arrange1)
arrange2 = arrange(NBA1516,desc(TotalMinutesPlayed),desc(GamesPlayed))
head(arrange2)
#結合group_by()、summarise()、arrange()，可完成一連串的資料分析。
result = group_by(NBA1516,Team,Position) %>% 
         summarise(Player_number=n(),
                   FieldGoalsMadeMean=mean(FieldGoalsMade),
                   FieldGoalsAttempted=mean(FieldGoalsAttempted)) %>% 
         arrange(desc(FieldGoalsMadeMean))
head(result)
#計算各隊各守備位置（以Team和Position作為分組依據）的球員數、平均投進的兩分球數以及平均投出的兩分球數，並依平均投"進"的兩分球數由大到小排序。
#rename()：新名稱=舊名稱
rename1 = rename(NBA1516,Po=Position)
rename1[1:5,1:5]