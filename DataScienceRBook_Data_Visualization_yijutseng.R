#[資料視覺化]

#資料視覺化的目的##################################################################################################
#延續探索式資料分析，探索式資料分析可分為圖形化(Graphical)或量化(Quantitative)分析，
#總括來說作圖的目的有:
##了解資料的特性(類別資料、數值資料？)
##尋找資料的模式(patterns)
##建議資料分析與建模的策略
##結果呈現與溝通

#其中前三項屬於探索圖 (Exploratory graphs)；結果呈現與溝通屬於結果圖 (Final graphs)：
#探索圖屬探索式資料分析，目的是在『看』與『觀察』資料的樣子，所以探索圖有以下特性:
##很快就可以做一張圖
##探索過程中，可能可以做圖
##主要目的是勾勒與了解資料的輪廓與樣貌
##不用做圖形格式調整美化

#而在製作結果圖 (Final graphs)時，則須考慮以下事項:
##比較，呈現差異：
###比較什麼？誰跟誰比較？
##呈現因果關係（causality）,機制（mechanism）,結果解釋（explanation）,系統化的結構（systematic structure）：
###因果模型？為什麼你想要做這樣的比較。
##呈現多變數（Multivariate）資料：
###多變數（Multivariate）：超過兩個變數就叫多變數
###所有真實事件都是多變數的
##將證據整合呈現：
###在同一個畫面呈現文字、數字、影像、圖表
###盡量用圖形呈現資料
##將圖表做適當的標記與說明，包括xy軸名稱、單位、資料來源等：
###資料圖表必須可以呈現你想說的故事
##內容才是最重要的：
###資料不好，分析不好，圖表再美也沒有用!!!

#在R中，有三個常用的畫圖套件，包括：基本功能(Base)、lattice以及ggplot2。
#由於各套件繪圖邏輯不同，此處使用最常見之ggplot2套件。
#####################################################################################################################
#ggplot2 (Wickham, Chang, et al. 2020)的開發靈感來自於Dr. Leland Wilkinson的Grammar of Graphics
##“In brief, the grammar tells us that a statistical graphic is a mapping from data to aesthetic attributes (colour, shape, size) of geometric objects (points, lines, bars). The plot may also contain statistical transformations of the data and is drawn on a specific coordinate system”
##-from ggplot2 book.

#簡單來說，做圖的文法包括兩個最主要元素：
##Aesthetic attributes(審美屬性)：包括顏色、形狀、點的大小與線的粗細等。
##Geometric objects(幾何物件)：包括點、線、盒狀圖、直條圖等。
#其他元素包括：
##Facets：提供在同一張圖內做多個子圖的方法，只要使用Faceting功能設定子圖分類的依據參數即可。
##Stats：將資料做統計轉換。
##Scales：修改點線的顏色、形狀、xy軸的範圍等。

#在開始學ggplot2的核心功能之前，qplot()是ggplot2 Package提供最基本的畫圖方法，跟基本的plot() function很接近，提供一個簡單入門的方法。
#qplot()
##qplot()為ggplot2 "Hello, world!"
#qplot(x軸名稱,y軸名稱,data=使用資料)：
##雙變數：散佈圖。
##單變數：直方圖。

#install.packages("SportsAnalytics")
library(SportsAnalytics)
#install.packages("ggplot2")
library(ggplot2)
NBA1516 = fetch_NBAPlayerStatistics("15-16") ##讀入資料

qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516)
#文法的第一個主要元素Aesthetics：包括顏色、形狀、點的大小與線的粗細等。
qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516, color=Position) ##加上color=Position指令，表示用守備位置Position著色。
#文法的第二個主要元素Geometric：包括點、線、盒狀圖、直條圖等。
qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516, geom=c("point","smooth"))
##加上geom = c("point", "smooth")指令，在圖上加點與漸進線。
#如果輸入的變量並非雙變量，而是單變量時，預設圖形會從散佈圖變為Histograms直方圖！
qplot(TotalPoints, data=NBA1516, fill=Position) ##畫TotalPoints的直方圖/ fill = Position 並用守備位置Position著色。

#作圖的Facets元素可提供在同一張圖內做多個子圖的方法，只要使用facets =來設定子圖分類的依據參數即可。
#以下圖為例，輸入的變量是雙變量，所以預設圖形為散佈圖。
#設定子圖的語法為直向分類~橫向分類：
##直向分類意指以增加列（Row）的方式畫子圖；
##橫向分類意指以增加行（Column）的方式畫子圖。
#通常只會設定單一方向，如果選擇的是直向，橫向分類部分可用.表示；如果選擇的是橫向，直向分類部分可用.表示。
qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516, facets=.~Position) ##facets = .~Position：用守備位置Position分群畫圖(橫向)。
qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516, facets=Position~.) ##facets = Position~.：用守備位置Position分群畫圖(直向)。
qplot(TotalPoints, data=NBA1516, facets=Position~., binwidth=2) ##binwidth=2：每2分一組。
qplot(TotalPoints, data=NBA1516, facets=Position~., binwidth=10) ##binwidth=2：每10分一組。
#qplot()提供快速方便的畫圖功能，並且保留部分參數設定的彈性；但若需要調整更多參數，仍須使用完整的ggplot()函式。

#ggplot()##############################################################################################################
#使用ggplot2作圖有以下步驟：
##準備好資料。
##設定Aesthetic attributes：使用aes(x, y, ...)指定。
##指定Geometric objects：常用的包括geom_point()、geom_line()、geom_histogram()、geom_polygon()、geom_errorbar()。
#install.packages("ggplot2")
library(ggplot2)
df = data.frame(gp=factor(rep(letters[1:3], each=10)), y=rnorm(30)) ##產生範例畫圖資料。
#rep(x, times = 1, length.out = NA, each = 1)
##x 使用者想要相同重複元素的數值向量.
##times 數值向量 x 重複的次數.
##each 數值向量 x 的每個元素重複的次數.
##length.out = NA 數值向量 x 重複後的長度.
df
ggplot(df, aes(x=gp,y=y))+geom_point() ##設定兩個畫圖的重要元素Aesthetic attributes和Geometric objects。
ggplot(df, aes(x=gp,y=y))+geom_boxplot() ##設定兩個畫圖的重要元素Aesthetic attributes和Geometric objects。

#Faceting功能
df$z = df$y+rnorm(30) ##定義z值
?rnorm() ##rnorm(n, mean = 0, sd = 1)
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(gp~.) ##直向分圖
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(.~gp) ##橫向分圖
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(gp~.)+geom_smooth() ##使用geom_smooth()替xy散佈圖加上趨勢線
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(.~gp)+geom_smooth()
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(gp~.)+geom_smooth(method="lm") ##使用geom_smooth()的Linear Regression方法，替xy散佈圖加上趨勢線
#以下三種表示法皆同功：
##geom_smooth(method=lm)
##geom_smooth(method='lm')
##geom_smooth(method="lm")
ggplot(df, aes(x=z,y=y))+geom_line()+facet_grid(gp~.)
#用顏色分組，使用aes(color='group name')：
ggplot(df, aes(x=z,y=y,color=gp))+geom_line()+facet_grid(gp~.) ##gp不使用""括起來。

#畫圖前需要注意的幾個小地方：
##提供資料時，把資料修改為想要在圖片顯示的文字。從上面的範例可以發現，ggplot2會直接將資料分組（a/b/c）直接標在圖上，與其之後再來改圖，不如在資料處理時就將a/b/c改為有意義且可以直接使用的文字。
##如果是離散性的資料，但卻又是數值時（像是1,2,3）可以用factor()轉換，ggplot會將factor視為離散資料。

#除了基本的製圖外，ggplot2套件也提供完整的資料標示設定與其他參數設定功能，包括：
## 標籤 xlab(), ylab(), labs(x=,y=), ggtitle()
## 每一個geom_*()都有參數可設定
## 圖形樣式設定 theme()，可使用內建樣式
### theme_gray(): 灰背景，預設樣式
### theme_bw(): 黑白樣式
## 使用其他樣式套件
### ggthemes
### xkcd

#在比較多組的平均值高低時，因為各組樣本數與資料分佈不同，平均數的誤差值也會不同，
#所以在資料視覺化時，建議加上誤差線(Error bar)，誤差線通常使用在bar chart和line chart，而誤差值的計算有下列三種選擇：
##Standard deviation (SD) 標準差：呈現"資料本質"時使用。
##Standard error (SE) 標準誤差：呈現預估平均值的"可能誤差"時使用。
##Confidence interval (CI) 信賴區間：呈現預估平均值的"信心"時使用。
library(datasets)
library(data.table)
airquality$Month = as.factor(airquality$Month) ##將Month轉為因子變數。如果是離散性的資料，但卻又是數值時（像是1,2,3）可以用factor()轉換，ggplot會將factor視為離散資料。
airquality.mean = data.table(airquality)[,.(OzoneMean=mean(Ozone,na.rm=T)),by=Month] ##計算每月Ozone平均。
#na.rm=T，表示將na值remove。
ggplot()+geom_bar(data=airquality.mean, aes(x=Month,y=OzoneMean), stat="identity") ##stat="identity"直接畫數字。
#在ggplot2套件中，加上geom_errorbar()函式，設定資料高低值，能在原圖中添加誤差線。
airquality.stat = data.table(airquality)[,.(OzoneMean=mean(Ozone,na.rm=T),OzoneSD=sd(Ozone,na.rm=T)),by=Month] ##計算每月Ozone平均與標準差。
ggplot(data=airquality.stat)+geom_bar(aes(x=Month,y=OzoneMean),stat="identity")+geom_errorbar(aes(x=Month,ymin=OzoneMean-OzoneSD,ymax=OzoneMean+OzoneSD),width=.1)

#################################################################################################################
##https://rstudio-pubs-static.s3.amazonaws.com/471771_ddafb0cb0a234daea920ddf0a6935177.html
# Margins area
par(oma=c(3,3,3,3))  # all sides have 3 lines of space
par(mar=c(5,4,4,2) + 0.1)
  
# Plot
plot(0:10, 0:10, type="n", xlab="X", ylab="Y")    # type="n" hides the points
  
# Place text in the plot and color everything plot-related red
text(5,5, "Plot", col="red", cex=2)
  
# Place text in the margins and label the margins, all in forestgreen
mtext("Margins", side=3, line=2, cex=2, col="forestgreen")
mtext("par(mar=c(b,l,t,r))", side=3, line=1, cex=1, col="forestgreen")
mtext("Line 0", side=3, line=0, adj=1.0, cex=1, col="forestgreen")
mtext("Line 1", side=3, line=1, adj=1.0, cex=1, col="forestgreen")
mtext("Line 2", side=3, line=2, adj=1.0, cex=1, col="forestgreen")
mtext("Line 3", side=3, line=3, adj=1.0, cex=1, col="forestgreen")
box("figure", col="forestgreen")

# Label the outer margin area and color it blue
# Note the 'outer=TRUE' command moves us from the figure margins to the outer margins.
mtext("Outer Margin Area", side=1, line=1, cex=2, col="blue", outer=TRUE)
mtext("par(oma=c(b,l,t,r))", side=1, line=2, cex=1, col="blue", outer=TRUE)
mtext("Line 0", side=1, line=0, adj=0.0, cex=1, col="blue", outer=TRUE)
mtext("Line 1", side=1, line=1, adj=0.0, cex=1, col="blue", outer=TRUE)
mtext("Line 2", side=1, line=2, adj=0.0, cex=1, col="blue", outer=TRUE)
box("outer", col="blue")
#################################################################################################################