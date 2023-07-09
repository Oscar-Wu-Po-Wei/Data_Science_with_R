#資料探勘(Data Mining)、機器學習(Machine Learning)與深度學習(Deep Learning)
#https://github.com/yijutseng/DataAnalyticsWithRBook/blob/master/10-DataMining.Rmd

#資料探勘（Data mining）是用人工智慧、機器學習、統計學的交叉方法，在相對較大型的資料集中發現模式的計算過程。
#使用資料探勘技術可以建立從輸入資料學習新資訊，變成智慧的演算法或資料模式，用來預測事件或協助決策。
#所以，當資料太少或太髒的時候，資料探勘的效力會被影響。

#資料探勘要派上用場，必須有以下條件：
##有一些模式/模型可學。
##很難定義這些模式/模型。
##有資料可學這些模式/模型。

#資料探勘可分為監督式學習與非監督式學習：
##監督式學習的特點是訓練資料中有正確答案，由輸入物件和預期輸出所組成，而演算法可以由訓練資料中學到或建立一個模式，並依此模式推測新的實例。
##非監督式學習則不用提供正確答案，也就是不需要人力來輸入標籤，單純利用訓練資料的特性，將資料分群分組。

#此兩種學習可解決不同的問題，條列如下：
##Supervised learning 監督式學習
### Regression 迴歸：真實的"值"（股票、氣溫）
### Classification 分類：分兩類（P/N, Yes/No, M/F, Sick/Not sick）/分多類 (A/B/C/D)
##Unsupervised learning 非監督式學習
### Clustering 分群
### Association Rules 關聯式規則

#在監督式學習中常見的資料探勘演算法如下：
## Linear Regression 線性迴歸
## Logistic Regression 羅吉斯迴歸、邏輯迴歸
## Support Vector Machines 支持向量機
## Decision Trees 決策樹
## K-Nearest Neighbor
## Neural Networks 神經網路
## Deep Learning 深度學習

#在非監督式學習中常見的資料探勘演算法如下：
## Hierarchical clustering 階層式分群
## K-means clustering
## Neural Networks 神經網路
## Deep Learning 深度學習

#####################################################################################################################

#Regression 迴歸
##Regression Analysis 迴歸分析主要用在了解兩個或多個變數間是否相關、相關方向與強度，並建立數學模型以便觀察特定變數來預測研究者感興趣的變數，
#常見的迴歸分析演算法包括：
## Linear Regression 線性迴歸
## Logistic Regression 羅吉斯迴歸、邏輯迴歸

library(SportsAnalytics)
NBA1516 = fetch_NBAPlayerStatistics("15-16")
library(ggplot2)
ggplot(NBA1516,aes(x=TotalMinutesPlayed,y=TotalPoints))+geom_point()+geom_smooth(method="glm")##折線圖
ggplot(NBA1516,aes(x=TotalMinutesPlayed,y=TotalPoints))+geom_point()+geom_line(method="glm")##折線圖
## ggplot(NBA1516)同功於ggplot(data=NBA1516)。

#在R中，最基本的線性迴歸種類為「簡單線性迴歸」lm(formula,data=資料名稱)，formula格式：應變項~自變項1+自變項2+......
lm(TotalPoints~TotalMinutesPlayed,data=NBA1516)
##(總得分數TotalPoints等於0.4931 * 總出場分鐘數 -85.9071)
##(TotalPoints = 0.4931 * TotalMinutesPlayed -85.9071)

#廣義線性迴歸模型Generalized linear models(glm)，函數為glm()，使用方法與lm()類似，但被更廣泛的使用，包括了"線性迴歸模型"和"邏輯迴歸模型"。
#如果需要修改預設模型，可設定family參數：
## - family="gaussian" 線性(高斯)迴歸模型
## - family="binomial" 邏輯(二項式)迴歸模型
## - family="poisson"  卜瓦松迴歸模型
##Gaussian distribution高斯函數：常態分布的密度函數。
##Binomial distribution二項分布：n個獨立的是/非試驗中成功的次數的離散機率分布
##Poisson distribution次數分佈：
###某一服務設施在一定時間內受到的服務請求的次數
###公車站的候客人數
###機器故障數
###自然災害發生的次數
###DNA序列的變異數...

glm(TotalPoints~TotalMinutesPlayed+FieldGoalsAttempted, data=NBA1516)
glm(TotalPoints~TotalMinutesPlayed+FieldGoalsAttempted+Position, data=NBA1516)
#####################################################[上行解釋]#############################################################
#由此可知總得分數TotalPoints和上場分鐘數和兩分球出手數和守備位置的關係為： TotalPoints = -0.0065 * TotalMinutesPlayed + 1.28 FieldGoalsAttempted +22.85 + 22.85 PositionPF + -65.03 * PositionPG + -38.52 * PositionSF + -52.18 * PositionSG

#由上述結果可發現，守備位置的變項被轉為虛擬變項(Dummy Variable)：PositionPF、PositionPG、PositionSF、PositionSG，如果是控球後衛（PG），會得到：
## PositionPF=0
## PositionPG=1
## PositionSF=0
## PositionSG=0

#可能有人會問，那中鋒去哪了？其實中鋒被當作基準項，也就是當守備位置是中鋒(C)時，會得到：
## PositionPF=0
## PositionPG=0
## PositionSF=0
## PositionSG=0
##########################################################################################################################

#多變量線性迴歸分析有下列特色：
##假設：各變數相互獨立！
##若自變項X是類別變項，需要建立虛擬變項。
##在R裡，類別變項請記得轉成factor，R會自動建立虛擬變項！
##用在依變數為連續變數，自變數為連續變數或虛擬變數的背景條件。

#Logistic Regression 邏輯迴歸##############################################################################################
# - family="binomial" 邏輯迴歸模型
#常用在依變數為二元變數（非0即1）的場合，如：生病/沒生病；錄取/不錄取。
mydata = read.csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/binary.csv")
## GRE:GRE成績, GPA:在校平均成績, rank:學校排名。
mydata$rank = factor(mydata$rank)
mylogit = glm(admit~gre+gpa+rank,data=mydata,family="binomial") ##logit：Logistic Regression的簡稱。
summary1 = summary(mylogit)
summary1$coefficients

#最佳模型篩選
#該用何種模型預測，會得到最準確的結果？
#在迴歸模型中，常用的判斷準則包括：
## Akaike's Information Criterion (AIC)：赤池訊息量準則（英語：Akaike information criterion，簡稱AIC）是評估統計模型的複雜度和衡量統計模型「擬合」資料之優良性（英語：Goodness of Fit，白話：合身的程度）的一種標準，是由日本統計學家赤池弘次創立和發展的。赤池訊息量準則建立在訊息熵的概念基礎上。
## Bayesian Information Criterion (BIC)：貝葉斯信息量準則（英語：Bayesian information criterion或者：Schwarz information criterion；縮寫：BIC、SIC、SBC、SBIC）是在有限集合中進行模型選擇的準則：BIC最低的模型是最好的。[1]該準則部分基於似然函數並與赤池信息量準則（AIC）緊密相關。擬合模型時，增加參數可提高似然，但如此下去可能導致過擬合。BIC與AIC都致力於向模型中引入關於參數數量的懲罰項；其中，BIC中的懲罰項會大於AIC中的懲罰項。
#AIC和BIC都是「數值越小越好」，以下建立三個模型，並比較其AIC：
OneVar = glm(TotalPoints~TotalMinutesPlayed,data=NBA1516)
TwoVar = glm(TotalPoints~TotalMinutesPlayed+FieldGoalsAttempted,data=NBA1516)
ThreeVar = glm(TotalPoints~TotalMinutesPlayed+FieldGoalsAttempted+Position,data=NBA1516)
c(OneVar$aic, TwoVar$aic, ThreeVar$aic)
#在建立迴歸模型時，常會遇到到底該放多少參數？所有參數都有用嗎？之類的問題，我們可以藉由觀察coefficients來判斷參數在模型中的"實用程度"。
summary2 = summary(TwoVar)
summary2$coefficients
summary3 = summary(ThreeVar)
summary3$coefficients
c(summary2$coefficients,summary3$coefficients)

#Decision Trees 決策樹#####################################################################################################
#決策樹是在樹狀目錄中建立一系列分割，以建立模型。
#這些分割會表示成「節點」(Node)。每次發現輸入資料行與可預測資料行有明顯地相互關聯時，此演算法就會在模型中加入一個節點。
#演算法決定分岔的方式不同，視它預測連續資料行或分隔資料行而定。
#常見的決策樹：Classification and Regression Tree (CART)，使用rpart套件。
##建立決策樹的函數為rpart()，語法為rpart(formula, data)。
#install.packages("rpart")
library(rpart)
DT = rpart(Position~Blocks+ThreesMade+Assists+Steals,data=NBA1516) ##使用阻攻/三分/助攻/抄截數據來判斷球員守備位置。
DT

#以下三行需要一次性的同時執行：
par(mfrow=c(1,1), mar=rep(1,4)) #下,左,上,右
plot(DT)
text(DT,use.n=F,all=F,cex=1)

#par
##A vector of the form c(nr, nc).
##Subsequent figures will be drawn in an nr-by-nc array on the device by columns (mfcol), or rows (mfrow), respectively.
##改變圖表的擺放，我們可以透過par()裡面的$mfrow，mfrow的原始設定數值是(nr=1,nc=1)，代表的是每次製作時只有一張圖在一個畫面。

#rep(x, times = 1, length.out = NA, each = 1)
##x 使用者想要相同重複元素的數值向量.
##times 數值向量 x 重複的次數.
##each 數值向量 x 的每個元素重複的次數.
##length.out = NA 數值向量 x 重複後的長度.

#plot函數的寫法為：
##plot(x = x軸資料, y = y軸資料, type = “一個資料型態（等等會介紹）, main = 大標題, sub = 小標題, xlab = x軸標籤, ylab = y軸標籤, asp = y/x軸比例)

#預設的plot()畫出來的圖很難懂，可改用rpart.plot套件中的prp()函數：
#install.packages("rpart")
#install.packages("rpart.plot") ##20220311測試無法安裝。
library(rpart)
library(rpart.plot)
prp(DT) ##因無法安裝，故無法繪圖。

#決策樹演算法決定節點的方式如下：
## Gini impurity
## Information gain
## Variance reduction

#Clustering 分群：將相近的觀察值作做分群。####################################################################################
##分群過程中，可能會遇到以下問題：
### 如何定義相近？
### 如何分群？
### 如何視覺化？
### 如何解釋分群？
#Hierarchical clustering 階層式分群
##An agglomerative approach
### Find closest two things
### Put them together
### Find next closest
##Requires
### A defined distance
### A merging approach
##Produces
### A tree showing how close things are to each other
#如何定義相近？用距離distance的概念來定義相近。
##Distance or similarity
### Continuous - euclidean distance
### Continuous - correlation similarity
### Binary - manhattan distance
##Pick a distance/similarity that makes sense for your problem

#Merging approach
##Agglomerative 聚合
### Single-linkage：取最小值
### Complete-linkage：取最大值
### Average-linkage：取平均值

#使用dist()函數計算距離，使用method=""設定計算距離的依據。
#dist()函數可用方法包括： "euclidean", "maximum", "manhattan", "canberra", "binary" 或 "minkowski"。
mtcars.mxs = as.matrix(mtcars)
d_euclidean = dist(mtcars.mxs)    				 ##預設為euclidean(歐幾里得距離)
d_euclidean
d_manhattan = dist(mtcars.mxs,method="manhattan")
d_manhattan
#用hclust函數畫圖，必要參數是各觀察值的距離（可用dist()函數計算）
par(mar=rep(2,4),mfrow=c(1,1))   			       ##mar=rep(2,4)：margin下左上右皆為2，重複四次。
hc1 = hclust(dist(mtcars.mxs))    				 ##可用method設定聚類方法，沒有指定預設使用complete。
plot(hc1)
par(mar=rep(2,4),mfrow=c(1,1))
hc2 = hclust(dist(mtcars.mxs),method="average")        ##聚類方法為計算平均距離。
plot(hc2)

clusterCut = cutree(hc1, k=5)     				 ##剪枝，分五群。
sort(clusterCut)
library(ggplot2)
ggplot()+geom_point(data=mtcars,
			  aes(x=hp,                          ##horsepower
				y=mpg,                         ##miles per gallon
				color=as.factor(clusterCut)))  ##使用clusterCut作為分類類別因子，並進行顏色區分。
clusterCut = cutree(hc1, h=4)					 ##切在高度=4的地方（距離=4）
sort(clusterCut)
distxy = dist(mtcars.mxs)
x=scale(mtcars$hp[-1]);y=scale(mtcars$mpg[-1])         ##scale()數據標準化
labelCar = rownames(mtcars)[-1]
plot(x,y,col="blue",pch=19,cex=2)
text(x+0.05,y+0.05,labels=labelCar)

##https://www.r-graph-gallery.com/275-add-text-labels-with-ggplot2.html###########################################
# library
# library(ggplot2)
 
# Keep 30 first rows in the mtcars natively available dataset
#data=head(mtcars, 30)
 
# 1/ add text with geom_text, use nudge to nudge the text
#ggplot(data, aes(x=wt, y=mpg)) +
#  geom_point() + # Show dots
#  geom_label(
#    label=rownames(data), 
#    nudge_x = 0.25, nudge_y = 0.25, 
#    check_overlap = T
#  )

dataFrame = data.frame(x,y)
kmeansObj = kmeans(dataFrame,centers=3)
names(kmeansObj)
kmeansObj$cluster
kmeansObj$center

par(mar=rep(0.2,4))
#plot(x,y,col=kmeansObj$cluster,pch=19,cex=2)
points(kmeansObj$centers,col=1:3,pch=3,cex=3,lwd=3)
set.seed(1234)
dataMatrix
###################################################################################################################

#HeatMap###########################################################################################################
par(mar=rep(0.2,4),mfrow=c(1,1))
heatmap(mtcars.mxs)

distxy = dist(mtcars.mxs)
hClustering = hclust(distxy)
plot(hClustering)

#Association Rules 關聯式規則########################################################################################
#關聯式規則用於從大量數據中挖掘出有價值的數據項之間的相關關係，原則為不考慮項目的次序，而僅考慮其組合。
#著名的購物籃分析(Market Basket Analysis)即為關聯式規則分析的應用。
#而Apriori演算法是挖掘布林關聯規則(Boolean association rules)頻繁項集的算法，
#在R中，可以使用arules(Hahsler et al. 2020)套件來執行關聯式規則分析。

# Load the libraries
if (!require('arules')){
  install.packages("arules");
  library(arules) #for Apriori演算法
}
if (!require('datasets')){
  install.packages("datasets");
  library(datasets) #for Groceries data
}
data(Groceries) # Load the data set
Groceries@data@Dim #169 種商品，9835筆交易資料

# Get the rules
rules <- apriori(Groceries, # data= Groceries
                 parameter = list(supp = 0.001, conf = 0.8), #參數最低限度
                 control = list(verbose=F)) #不要顯示output
options(digits=2) # Only 2 digits
inspect(rules[1:5]) # Show the top 5 rules

rules<-sort(rules, by="confidence", decreasing=TRUE) #按照confidence排序
inspect(rules[1:5]) # Show the top 5 rules

rulesR<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08),
        appearance = list(default="lhs",rhs="whole milk"), #設定右邊一定要是牛奶
        control = list(verbose=F)) #不要顯示output
rulesR<-sort(rulesR, decreasing=TRUE,by="confidence") #按照confidence排序
inspect(rulesR[1:5]) # Show the top 5 rules

rulesL<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2),
        appearance = list(default="rhs",lhs="whole milk"), #設定左邊一定要是牛奶
        control = list(verbose=F)) #不要顯示output
rulesL<-sort(rulesL, decreasing=TRUE,by="confidence") #按照confidence排序
inspect(rulesL[1:5]) # Show the top 5 rules

if (!require('arulesViz')){
  install.packages("arulesViz"); 
  library(arulesViz)
}
#Mac->http://planspace.org/2013/01/17/fix-r-tcltk-dependency-problem-on-mac/
plot(rules,method="graph",interactive=TRUE) #,shading=NA) #會跑一陣子

#########################################################################################################################
#R筆記–(9)分群分析(Clustering)：https://rpubs.com/skydome20/R-Note9-Clustering
#在分群分析中，最難回答的問題是「什麼樣的個體該被分在一個群體中」？
#一般來說，可以從兩個角度來思考：緊緻性(Compactness)跟連通性(Connectedness)。
#主要可以分成兩種類型：
##緊緻性(Compactness)，會希望「個體之間的距離越小越好」，讓群體內部越緊緻越好：
###階層式分群(Hierarchical Clustering)：不需指定分群數目，讓資料自動由上往下/由下往上結合起來。
###分割式分群(Partitional Clustering)：需事先指定分群數目，經過不斷的迭代，直到群內的變異最小。
##連通性(Connectedness)，會希望「可以串接的個體分在同一群」：
###譜分群(Spectral Clustering)：基於圖論跟Graph Laplacian的方法，能把「資料的形狀(shape)」考量進來。

#(1)階層式分群(Hierarchical Clustering)##################################################################################
head(iris)
iris_for_clustering = iris[,-5] ##由於分群屬於「非監督式學習」的演算法，因此我們先把iris內的品種(Species)欄位拿掉，以剩下的資料進行分群。
head(iris_for_clustering)
#在階層式分群中，主要是以資料之間的「距離」遠近，來決定兩筆資料是否接近。
#R語言中，使用dist()，來建立資料之間的「距離矩陣」(Distance Matrix)，判斷資料之間的遠與近：
E.dist = dist(iris_for_clustering, method="euclidean") #歐幾里德距離矩陣
M.dist = dist(iris_for_clustering, method="manhattan") #曼哈頓距離矩陣
##此處只要直接將iris_for_clustering輸入dist()函數，指定方法後就會進行自動測距，不用手動分群~

par(mfrow=c(1,2)) ##讓圖片以1x2的方式呈現。

#使用歐式距離進行分群
h.E.cluster = hclust(E.dist)
plot(h.E.cluster,xlab="歐幾里德距離分群")
#使用曼哈頓距離進行分群
h.M.cluster = hclust(M.dist)
plot(h.M.cluster,xlab="曼哈頓距離分群")

par(mfrow=c(2,3))
Single_clust = hclust(E.dist, method="single")         # 最近法
Complete_clust = hclust(E.dist, method="complete")     # 最遠法
Average_clust = hclust(E.dist, method="average")       # 平均法
Centroid_clust = hclust(E.dist, method="centroid")     # 中心法
Ward_clust = hclust(E.dist, method="ward.D2")          # 華德法
plot(Single_clust)
plot(Complete_clust)
plot(Average_clust)
plot(Centroid_clust)
plot(Ward_clust)

E.dist = dist(iris_for_clustering,method="euclidean")
h.cluster = hclust(E.dist,method="ward.D2")
#視覺化
plot(h.cluster)
abline(h=9,col="red")
由上圖，可以觀察最佳的分群數目是3個，
因此我們可以利用cutree()，讓整個階層的結構縮減，變成分成三群的狀態：
cut.h.cluster = cutree(h.cluster,k=3)   ##分成三群
cut.h.cluster                           ##分群結果
sort(cut.h.cluster)                     ##將分群結果排序
table(cut.h.cluster,iris$Species)       ##將分群結果與原始資料實際結果，以表格形式呈現，便於比較分析。

library(ggplot2)
qplot(Petal.Length,Petal.Width,data=iris,color=Species)

#(2)切割式分群(Partitional Clustering)###################################################################################
#在切割式分群裡，最常見就是K-Cluster的方法，並且根據分群條件的不同，可以分成：
##(1)K-Means：使用函式是kmeans()。 ##R語言之K-means機器學習演算法################################################################
kmeans.cluster = kmeans(iris_for_clustering,centers=3) ##分成三群：三個群心。
kmeans.cluster$withinss ##群內變異數(withinSS): Within-class Sum of Squares Matrix。
table(kmeans.cluster$cluster,iris$Species) ##分群結果和實際結果比較。
##視覺化 k-means 分群結果(基於ggplot2的語法)
#install.packages("factoextra")	
library(ggplot2)
##factoextra: Extract and Visualize the Results of Multivariate Data Analyses.
require(factoextra) ##require()為閹割版library()；factoextra載入需要ggplot2套件。
##fviz_cluster：Visualize Clustering Results in factoextra.
fviz_cluster(kmeans.cluster, 		    ##分群結果
		 data=iris_for_clustering,  ##資料
		 geom=c("point","text"),    ##點與標籤(point & label)
		 frame.type="norm")	    ##框架型態

##(2)K-Medoid：使用函式是pam()=partition around medoid，在cluster這個套件裡面。
#install.packages("cluster")
require(cluster)
kmedoid.cluster = pam(iris_for_clustering,k=3)
kmedoid.cluster$objective ##群內變異數
table(kmedoid.cluster$clustering, iris$Species) ##分群結果和實際結果比較。
##視覺化 k-medoid 分群結果(基於ggplot2的語法)
require(factoextra)
fviz_cluster(kmedoid.cluster,
		 data=iris_for_clustering,
		 geom=c("point"),
		 frame.type="norm")

#(3)分群的最佳數目(Optimal number of clusters)############################################################################
##在進行分群時，往往會遇到一個很重要的問題，那就是：最佳的分群數目為何？
#(3-1)Elbow Method
##分群的目的，就是「使群內的總變異最小；使群間的總變異最大」。
##換句話說，我們只要找出一個數字n，使得資料被分成n群時，群內的總變異(SSE)會最小，那麼n = 最佳的分群數目(optimal number for clusters)！
##在factoextra的套件裡，已經幫我們寫好函式fviz_nbclust()，可以讓我們實踐Elbow Method。
##函式fviz_nbclust()，是基於ggplot2的語法，將Elbow Method的結果視覺化，
##概念和主成份分析中的陡坡圖(scree plot)幾乎一模一樣。
require(factoextra)
#Elbow Method運用在階層式分析
#hcut()屬於factoextra套件，並非上述hclust()。
fviz_nbclust(iris_for_clustering,
		 FUNcluster=hcut,       ##hierarchical clustering，也可以使用kmeans, pam, hcut, clara,...
	 	 method="wss",	      ##total within sum of square
		 k.max=12		      ##max number of clusters to consider
		 )+
labs(title="Elbow Method for HC")+
geom_vline(xintercept=3, ##在X=3的地方，
	     linetype=2)   ##畫一條虛線。

par(mfrow=c(1,2))

##Elbow Method 應用在 K-Means
fviz_nbclust(iris_for_clustering,
		 FUNcluster=kmeans,     ##hierarchical clustering，也可以使用kmeans, pam, hcut, clara,...
	 	 method="wss",	      ##total within sum of square
		 k.max=12		      ##max number of clusters to consider
		 )+
labs(title="Elbow Method for K-Means")+
geom_vline(xintercept=3,    		##在X=3的地方，
	     linetype=2)   		##畫一條虛線。

##Elbow Method 應用在 K-Medoid
fviz_nbclust(iris_for_clustering,
		 FUNcluster=pam,        ##hierarchical clustering，也可以使用kmeans, pam, hcut, clara,...
	 	 method="wss",	      ##total within sum of square
		 k.max=12		      ##max number of clusters to consider
		 )+
labs(title="Elbow Method for K-Medoid")+
geom_vline(xintercept=3, 		##在X=3的地方，
	     linetype=2)   		##畫一條虛線。

##Avg. Silhouette 應用在 K-Means
require(factoextra)
fviz_nbclust(iris_for_clustering,
		 FUNcluster=kmeans,	##K-Means
		 method="silhouette",   ##Avg. Silhouette
		 k.max=12			##max number of clusters to consider
		 )+
labs(title="Average Silhouette Method for K-Means") ##此處取最接近1的數值。
#輪廓的取值範圍為[-1, +1]：
##如果某一樣本的輪廓接近1，則說明樣本聚類結果合理；
##如果接近-1，則說明其更應該分類到其他的簇；
##如果輪廓近似為0，則說明該樣本在兩個簇的邊界上。
#########################################################################################################################
