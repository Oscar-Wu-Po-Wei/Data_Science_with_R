#��Ʊ���(Data Mining)�B�����ǲ�(Machine Learning)�P�`�׾ǲ�(Deep Learning)
#https://github.com/yijutseng/DataAnalyticsWithRBook/blob/master/10-DataMining.Rmd

#��Ʊ��ɡ]Data mining�^�O�ΤH�u���z�B�����ǲߡB�έp�Ǫ���e��k�A�b�۹���j������ƶ����o�{�Ҧ����p��L�{�C
#�ϥθ�Ʊ��ɧ޳N�i�H�إ߱q��J��ƾǲ߷s��T�A�ܦ����z���t��k�θ�ƼҦ��A�Ψӹw���ƥ�Ψ�U�M���C
#�ҥH�A����ƤӤ֩Τ�ż���ɭԡA��Ʊ��ɪ��ĤO�|�Q�v�T�C

#��Ʊ��ɭn���W�γ��A�������H�U����G
##���@�ǼҦ�/�ҫ��i�ǡC
##�����w�q�o�ǼҦ�/�ҫ��C
##����ƥi�ǳo�ǼҦ�/�ҫ��C

#��Ʊ��ɥi�����ʷ����ǲ߻P�D�ʷ����ǲߡG
##�ʷ����ǲߪ��S�I�O�V�m��Ƥ������T���סA�ѿ�J����M�w����X�Ҳզ��A�Ӻt��k�i�H�ѰV�m��Ƥ��Ǩ�Ϋإߤ@�ӼҦ��A�è̦��Ҧ������s����ҡC
##�D�ʷ����ǲ߫h���δ��ѥ��T���סA�]�N�O���ݭn�H�O�ӿ�J���ҡA��§Q�ΰV�m��ƪ��S�ʡA�N��Ƥ��s���աC

#����ؾǲߥi�ѨM���P�����D�A���C�p�U�G
##Supervised learning �ʷ����ǲ�
### Regression �j�k�G�u�ꪺ"��"�]�Ѳ��B��š^
### Classification �����G�������]P/N, Yes/No, M/F, Sick/Not sick�^/���h�� (A/B/C/D)
##Unsupervised learning �D�ʷ����ǲ�
### Clustering ���s
### Association Rules ���p���W�h

#�b�ʷ����ǲߤ��`������Ʊ��ɺt��k�p�U�G
## Linear Regression �u�ʰj�k
## Logistic Regression ù�N���j�k�B�޿�j�k
## Support Vector Machines ����V�q��
## Decision Trees �M����
## K-Nearest Neighbor
## Neural Networks ���g����
## Deep Learning �`�׾ǲ�

#�b�D�ʷ����ǲߤ��`������Ʊ��ɺt��k�p�U�G
## Hierarchical clustering ���h�����s
## K-means clustering
## Neural Networks ���g����
## Deep Learning �`�׾ǲ�

#####################################################################################################################

#Regression �j�k
##Regression Analysis �j�k���R�D�n�Φb�F�Ѩ�өΦh���ܼƶ��O�_�����B������V�P�j�סA�ëإ߼ƾǼҫ��H�K�[��S�w�ܼƨӹw����s�̷P���쪺�ܼơA
#�`�����j�k���R�t��k�]�A�G
## Linear Regression �u�ʰj�k
## Logistic Regression ù�N���j�k�B�޿�j�k

library(SportsAnalytics)
NBA1516 = fetch_NBAPlayerStatistics("15-16")
library(ggplot2)
ggplot(NBA1516,aes(x=TotalMinutesPlayed,y=TotalPoints))+geom_point()+geom_smooth(method="glm")##��u��
ggplot(NBA1516,aes(x=TotalMinutesPlayed,y=TotalPoints))+geom_point()+geom_line(method="glm")##��u��
## ggplot(NBA1516)�P�\��ggplot(data=NBA1516)�C

#�bR���A�̰򥻪��u�ʰj�k�������u²��u�ʰj�k�vlm(formula,data=��ƦW��)�Aformula�榡�G���ܶ�~���ܶ�1+���ܶ�2+......
lm(TotalPoints~TotalMinutesPlayed,data=NBA1516)
##(�`�o����TotalPoints����0.4931 * �`�X�������� -85.9071)
##(TotalPoints = 0.4931 * TotalMinutesPlayed -85.9071)

#�s�q�u�ʰj�k�ҫ�Generalized linear models(glm)�A��Ƭ�glm()�A�ϥΤ�k�Plm()�����A���Q��s�x���ϥΡA�]�A�F"�u�ʰj�k�ҫ�"�M"�޿�j�k�ҫ�"�C
#�p�G�ݭn�ק�w�]�ҫ��A�i�]�wfamily�ѼơG
## - family="gaussian" �u��(����)�j�k�ҫ�
## - family="binomial" �޿�(�G����)�j�k�ҫ�
## - family="poisson"  �R�˪Q�j�k�ҫ�
##Gaussian distribution������ơG�`�A�������K�ר�ơC
##Binomial distribution�G�������Gn�ӿW�ߪ��O/�D���礤���\�����ƪ��������v����
##Poisson distribution���Ƥ��G�G
###�Y�@�A�ȳ]�I�b�@�w�ɶ������쪺�A�ȽШD������
###���������ԫȤH��
###�����G�ټ�
###�۵M�a�`�o�ͪ�����
###DNA�ǦC���ܲ���...

glm(TotalPoints~TotalMinutesPlayed+FieldGoalsAttempted, data=NBA1516)
glm(TotalPoints~TotalMinutesPlayed+FieldGoalsAttempted+Position, data=NBA1516)
#####################################################[�W�����]#############################################################
#�Ѧ��i���`�o����TotalPoints�M�W�������ƩM����y�X��ƩM�u�Ʀ�m�����Y���G TotalPoints = -0.0065 * TotalMinutesPlayed + 1.28 FieldGoalsAttempted +22.85 + 22.85 PositionPF + -65.03 * PositionPG + -38.52 * PositionSF + -52.18 * PositionSG

#�ѤW�z���G�i�o�{�A�u�Ʀ�m���ܶ��Q�ର�����ܶ�(Dummy Variable)�GPositionPF�BPositionPG�BPositionSF�BPositionSG�A�p�G�O���y��á]PG�^�A�|�o��G
## PositionPF=0
## PositionPG=1
## PositionSF=0
## PositionSG=0

#�i�঳�H�|�ݡA�����W�h���F�H��ꤤ�W�Q���@��Ƕ��A�]�N�O���u�Ʀ�m�O���W(C)�ɡA�|�o��G
## PositionPF=0
## PositionPG=0
## PositionSF=0
## PositionSG=0
##########################################################################################################################

#�h�ܶq�u�ʰj�k���R���U�C�S��G
##���]�G�U�ܼƬۤ��W�ߡI
##�Y���ܶ�X�O���O�ܶ��A�ݭn�إߵ����ܶ��C
##�bR�̡A���O�ܶ��аO�o�নfactor�AR�|�۰ʫإߵ����ܶ��I
##�Φb���ܼƬ��s���ܼơA���ܼƬ��s���ܼƩε����ܼƪ��I������C

#Logistic Regression �޿�j�k##############################################################################################
# - family="binomial" �޿�j�k�ҫ�
#�`�Φb���ܼƬ��G���ܼơ]�D0�Y1�^�����X�A�p�G�ͯf/�S�ͯf�F����/�������C
mydata = read.csv("https://raw.githubusercontent.com/CGUIM-BigDataAnalysis/BigDataCGUIM/master/binary.csv")
## GRE:GRE���Z, GPA:�b�ե������Z, rank:�ǮձƦW�C
mydata$rank = factor(mydata$rank)
mylogit = glm(admit~gre+gpa+rank,data=mydata,family="binomial") ##logit�GLogistic Regression��²�١C
summary1 = summary(mylogit)
summary1$coefficients

#�̨μҫ��z��
#�ӥΦ�ؼҫ��w���A�|�o��̷ǽT�����G�H
#�b�j�k�ҫ����A�`�Ϊ��P�_�ǫh�]�A�G
## Akaike's Information Criterion (AIC)�G�����T���q�ǫh�]�^�y�GAkaike information criterion�A²��AIC�^�O�����έp�ҫ��������שM�Ŷq�έp�ҫ��u���X�v��Ƥ��u�}�ʡ]�^�y�GGoodness of Fit�A�ոܡG�X�����{�ס^���@�ؼзǡA�O�Ѥ饻�έp�Ǯa���������ХߩM�o�i���C�����T���q�ǫh�إߦb�T���i��������¦�W�C
## Bayesian Information Criterion (BIC)�G�������H���q�ǫh�]�^�y�GBayesian information criterion�Ϊ̡GSchwarz information criterion�F�Y�g�GBIC�BSIC�BSBC�BSBIC�^�O�b�������X���i��ҫ���ܪ��ǫh�GBIC�̧C���ҫ��O�̦n���C[1]�ӷǫh���������M��ƨûP�����H���q�ǫh�]AIC�^��K�����C���X�ҫ��ɡA�W�[�Ѽƥi�������M�A���p���U�h�i��ɭP�L���X�CBIC�PAIC���P�O��V�ҫ����ޤJ����ѼƼƶq���g�@���F�䤤�ABIC�����g�@���|�j��AIC�����g�@���C
#AIC�MBIC���O�u�ƭȶV�p�V�n�v�A�H�U�إߤT�Ӽҫ��A�ä����AIC�G
OneVar = glm(TotalPoints~TotalMinutesPlayed,data=NBA1516)
TwoVar = glm(TotalPoints~TotalMinutesPlayed+FieldGoalsAttempted,data=NBA1516)
ThreeVar = glm(TotalPoints~TotalMinutesPlayed+FieldGoalsAttempted+Position,data=NBA1516)
c(OneVar$aic, TwoVar$aic, ThreeVar$aic)
#�b�إ߰j�k�ҫ��ɡA�`�|�J��쩳�ө�h�ְѼơH�Ҧ��ѼƳ����ζܡH���������D�A�ڭ̥i�H�ǥ��[��coefficients�ӧP�_�ѼƦb�ҫ�����"��ε{��"�C
summary2 = summary(TwoVar)
summary2$coefficients
summary3 = summary(ThreeVar)
summary3$coefficients
c(summary2$coefficients,summary3$coefficients)

#Decision Trees �M����#####################################################################################################
#�M����O�b�𪬥ؿ����إߤ@�t�C���ΡA�H�إ߼ҫ��C
#�o�Ǥ��η|���ܦ��u�`�I�v(Node)�C�C���o�{��J��Ʀ�P�i�w����Ʀ榳����a�ۤ����p�ɡA���t��k�N�|�b�ҫ����[�J�@�Ӹ`�I�C
#�t��k�M�w���ê��覡���P�A�����w���s���Ʀ�Τ��j��Ʀ�өw�C
#�`�����M����GClassification and Regression Tree (CART)�A�ϥ�rpart�M��C
##�إߨM���𪺨�Ƭ�rpart()�A�y�k��rpart(formula, data)�C
#install.packages("rpart")
library(rpart)
DT = rpart(Position~Blocks+ThreesMade+Assists+Steals,data=NBA1516) ##�ϥΪ���/�T��/�U��/�ۺI�ƾڨӧP�_�y���u�Ʀ�m�C
DT

#�H�U�T��ݭn�@���ʪ��P�ɰ���G
par(mfrow=c(1,1), mar=rep(1,4)) #�U,��,�W,�k
plot(DT)
text(DT,use.n=F,all=F,cex=1)

#par
##A vector of the form c(nr, nc).
##Subsequent figures will be drawn in an nr-by-nc array on the device by columns (mfcol), or rows (mfrow), respectively.
##���ܹϪ����\��A�ڭ̥i�H�z�Lpar()�̭���$mfrow�Amfrow����l�]�w�ƭȬO(nr=1,nc=1)�A�N�����O�C���s�@�ɥu���@�i�Ϧb�@�ӵe���C

#rep(x, times = 1, length.out = NA, each = 1)
##x �ϥΪ̷Q�n�ۦP���Ƥ������ƭȦV�q.
##times �ƭȦV�q x ���ƪ�����.
##each �ƭȦV�q x ���C�Ӥ������ƪ�����.
##length.out = NA �ƭȦV�q x ���ƫ᪺����.

#plot��ƪ��g�k���G
##plot(x = x�b���, y = y�b���, type = ���@�Ӹ�ƫ��A�]�����|���С^, main = �j���D, sub = �p���D, xlab = x�b����, ylab = y�b����, asp = y/x�b���)

#�w�]��plot()�e�X�Ӫ��ϫ������A�i���rpart.plot�M�󤤪�prp()��ơG
#install.packages("rpart")
#install.packages("rpart.plot") ##20220311���յL�k�w�ˡC
library(rpart)
library(rpart.plot)
prp(DT) ##�]�L�k�w�ˡA�G�L�kø�ϡC

#�M����t��k�M�w�`�I���覡�p�U�G
## Gini impurity
## Information gain
## Variance reduction

#Clustering ���s�G�N�۪��[��ȧ@�����s�C####################################################################################
##���s�L�{���A�i��|�J��H�U���D�G
### �p��w�q�۪�H
### �p����s�H
### �p���ı�ơH
### �p��������s�H
#Hierarchical clustering ���h�����s
##An agglomerative approach
### Find closest two things
### Put them together
### Find next closest
##Requires
### A defined distance
### A merging approach
##Produces
### A tree showing how close things are to each other
#�p��w�q�۪�H�ζZ��distance�������өw�q�۪�C
##Distance or similarity
### Continuous - euclidean distance
### Continuous - correlation similarity
### Binary - manhattan distance
##Pick a distance/similarity that makes sense for your problem

#Merging approach
##Agglomerative �E�X
### Single-linkage�G���̤p��
### Complete-linkage�G���̤j��
### Average-linkage�G��������

#�ϥ�dist()��ƭp��Z���A�ϥ�method=""�]�w�p��Z�����̾ڡC
#dist()��ƥi�Τ�k�]�A�G "euclidean", "maximum", "manhattan", "canberra", "binary" �� "minkowski"�C
mtcars.mxs = as.matrix(mtcars)
d_euclidean = dist(mtcars.mxs)    				 ##�w�]��euclidean(�ڴX���o�Z��)
d_euclidean
d_manhattan = dist(mtcars.mxs,method="manhattan")
d_manhattan
#��hclust��Ƶe�ϡA���n�ѼƬO�U�[��Ȫ��Z���]�i��dist()��ƭp��^
par(mar=rep(2,4),mfrow=c(1,1))   			       ##mar=rep(2,4)�Gmargin�U���W�k�Ҭ�2�A���ƥ|���C
hc1 = hclust(dist(mtcars.mxs))    				 ##�i��method�]�w�E����k�A�S�����w�w�]�ϥ�complete�C
plot(hc1)
par(mar=rep(2,4),mfrow=c(1,1))
hc2 = hclust(dist(mtcars.mxs),method="average")        ##�E����k���p�⥭���Z���C
plot(hc2)

clusterCut = cutree(hc1, k=5)     				 ##�ŪK�A�����s�C
sort(clusterCut)
library(ggplot2)
ggplot()+geom_point(data=mtcars,
			  aes(x=hp,                          ##horsepower
				y=mpg,                         ##miles per gallon
				color=as.factor(clusterCut)))  ##�ϥ�clusterCut�@���������O�]�l�A�öi���C��Ϥ��C
clusterCut = cutree(hc1, h=4)					 ##���b����=4���a��]�Z��=4�^
sort(clusterCut)
distxy = dist(mtcars.mxs)
x=scale(mtcars$hp[-1]);y=scale(mtcars$mpg[-1])         ##scale()�ƾڼзǤ�
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

#Association Rules ���p���W�h########################################################################################
#���p���W�h�Ω�q�j�q�ƾڤ������X�����Ȫ��ƾڶ��������������Y�A��h�����Ҽ{���ت����ǡA�ӶȦҼ{��զX�C
#�ۦW���ʪ��x���R(Market Basket Analysis)�Y�����p���W�h���R�����ΡC
#��Apriori�t��k�O�������L���p�W�h(Boolean association rules)�W�c��������k�A
#�bR���A�i�H�ϥ�arules(Hahsler et al. 2020)�M��Ӱ������p���W�h���R�C

# Load the libraries
if (!require('arules')){
  install.packages("arules");
  library(arules) #for Apriori�t��k
}
if (!require('datasets')){
  install.packages("datasets");
  library(datasets) #for Groceries data
}
data(Groceries) # Load the data set
Groceries@data@Dim #169 �ذӫ~�A9835��������

# Get the rules
rules <- apriori(Groceries, # data= Groceries
                 parameter = list(supp = 0.001, conf = 0.8), #�ѼƳ̧C����
                 control = list(verbose=F)) #���n���output
options(digits=2) # Only 2 digits
inspect(rules[1:5]) # Show the top 5 rules

rules<-sort(rules, by="confidence", decreasing=TRUE) #����confidence�Ƨ�
inspect(rules[1:5]) # Show the top 5 rules

rulesR<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08),
        appearance = list(default="lhs",rhs="whole milk"), #�]�w�k��@�w�n�O����
        control = list(verbose=F)) #���n���output
rulesR<-sort(rulesR, decreasing=TRUE,by="confidence") #����confidence�Ƨ�
inspect(rulesR[1:5]) # Show the top 5 rules

rulesL<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2),
        appearance = list(default="rhs",lhs="whole milk"), #�]�w����@�w�n�O����
        control = list(verbose=F)) #���n���output
rulesL<-sort(rulesL, decreasing=TRUE,by="confidence") #����confidence�Ƨ�
inspect(rulesL[1:5]) # Show the top 5 rules

if (!require('arulesViz')){
  install.packages("arulesViz"); 
  library(arulesViz)
}
#Mac->http://planspace.org/2013/01/17/fix-r-tcltk-dependency-problem-on-mac/
plot(rules,method="graph",interactive=TRUE) #,shading=NA) #�|�]�@�}�l

#########################################################################################################################
#R���O�V(9)���s���R(Clustering)�Ghttps://rpubs.com/skydome20/R-Note9-Clustering
#�b���s���R���A�����^�������D�O�u����˪�����ӳQ���b�@�Ӹs�餤�v�H
#�@��ӻ��A�i�H�q��Ө��רӫ�ҡG��o��(Compactness)��s�q��(Connectedness)�C
#�D�n�i�H������������G
##��o��(Compactness)�A�|�Ʊ�u���餧�����Z���V�p�V�n�v�A���s�餺���V��o�V�n�G
###���h�����s(Hierarchical Clustering)�G���ݫ��w���s�ƥءA����Ʀ۰ʥѤW���U/�ѤU���W���X�_�ӡC
###���Φ����s(Partitional Clustering)�G�ݨƥ����w���s�ƥءA�g�L���_�����N�A����s�����ܲ��̤p�C
##�s�q��(Connectedness)�A�|�Ʊ�u�i�H�걵��������b�P�@�s�v�G
###�Ф��s(Spectral Clustering)�G���Ͻ׸�Graph Laplacian����k�A���u��ƪ��Ϊ�(shape)�v�Ҷq�i�ӡC

#(1)���h�����s(Hierarchical Clustering)##################################################################################
head(iris)
iris_for_clustering = iris[,-5] ##�ѩ���s�ݩ�u�D�ʷ����ǲߡv���t��k�A�]���ڭ̥���iris�����~��(Species)��쮳���A�H�ѤU����ƶi����s�C
head(iris_for_clustering)
#�b���h�����s���A�D�n�O�H��Ƥ������u�Z���v����A�ӨM�w�ⵧ��ƬO�_����C
#R�y�����A�ϥ�dist()�A�ӫإ߸�Ƥ������u�Z���x�}�v(Distance Matrix)�A�P�_��Ƥ��������P��G
E.dist = dist(iris_for_clustering, method="euclidean") #�ڴX���w�Z���x�}
M.dist = dist(iris_for_clustering, method="manhattan") #�ҫ��y�Z���x�}
##���B�u�n�����Niris_for_clustering��Jdist()��ơA���w��k��N�|�i��۰ʴ��Z�A���Τ�ʤ��s~

par(mfrow=c(1,2)) ##���Ϥ��H1x2���覡�e�{�C

#�ϥμڦ��Z���i����s
h.E.cluster = hclust(E.dist)
plot(h.E.cluster,xlab="�ڴX���w�Z�����s")
#�ϥΰҫ��y�Z���i����s
h.M.cluster = hclust(M.dist)
plot(h.M.cluster,xlab="�ҫ��y�Z�����s")

par(mfrow=c(2,3))
Single_clust = hclust(E.dist, method="single")         # �̪�k
Complete_clust = hclust(E.dist, method="complete")     # �̻��k
Average_clust = hclust(E.dist, method="average")       # �����k
Centroid_clust = hclust(E.dist, method="centroid")     # ���ߪk
Ward_clust = hclust(E.dist, method="ward.D2")          # �ؼw�k
plot(Single_clust)
plot(Complete_clust)
plot(Average_clust)
plot(Centroid_clust)
plot(Ward_clust)

E.dist = dist(iris_for_clustering,method="euclidean")
h.cluster = hclust(E.dist,method="ward.D2")
#��ı��
plot(h.cluster)
abline(h=9,col="red")
�ѤW�ϡA�i�H�[��̨Ϊ����s�ƥجO3�ӡA
�]���ڭ̥i�H�Q��cutree()�A����Ӷ��h�����c�Y��A�ܦ������T�s�����A�G
cut.h.cluster = cutree(h.cluster,k=3)   ##�����T�s
cut.h.cluster                           ##���s���G
sort(cut.h.cluster)                     ##�N���s���G�Ƨ�
table(cut.h.cluster,iris$Species)       ##�N���s���G�P��l��ƹ�ڵ��G�A�H����Φ��e�{�A�K�������R�C

library(ggplot2)
qplot(Petal.Length,Petal.Width,data=iris,color=Species)

#(2)���Φ����s(Partitional Clustering)###################################################################################
#�b���Φ����s�̡A�̱`���N�OK-Cluster����k�A�åB�ھڤ��s���󪺤��P�A�i�H�����G
##(1)K-Means�G�ϥΨ禡�Okmeans()�C ##R�y����K-means�����ǲߺt��k################################################################
kmeans.cluster = kmeans(iris_for_clustering,centers=3) ##�����T�s�G�T�Ӹs�ߡC
kmeans.cluster$withinss ##�s���ܲ���(withinSS): Within-class Sum of Squares Matrix�C
table(kmeans.cluster$cluster,iris$Species) ##���s���G�M��ڵ��G����C
##��ı�� k-means ���s���G(���ggplot2���y�k)
#install.packages("factoextra")	
library(ggplot2)
##factoextra: Extract and Visualize the Results of Multivariate Data Analyses.
require(factoextra) ##require()���I�Ϊ�library()�Ffactoextra���J�ݭnggplot2�M��C
##fviz_cluster�GVisualize Clustering Results in factoextra.
fviz_cluster(kmeans.cluster, 		    ##���s���G
		 data=iris_for_clustering,  ##���
		 geom=c("point","text"),    ##�I�P����(point & label)
		 frame.type="norm")	    ##�ج[���A

##(2)K-Medoid�G�ϥΨ禡�Opam()=partition around medoid�A�bcluster�o�ӮM��̭��C
#install.packages("cluster")
require(cluster)
kmedoid.cluster = pam(iris_for_clustering,k=3)
kmedoid.cluster$objective ##�s���ܲ���
table(kmedoid.cluster$clustering, iris$Species) ##���s���G�M��ڵ��G����C
##��ı�� k-medoid ���s���G(���ggplot2���y�k)
require(factoextra)
fviz_cluster(kmedoid.cluster,
		 data=iris_for_clustering,
		 geom=c("point"),
		 frame.type="norm")

#(3)���s���̨μƥ�(Optimal number of clusters)############################################################################
##�b�i����s�ɡA�����|�J��@�ӫܭ��n�����D�A���N�O�G�̨Ϊ����s�ƥج���H
#(3-1)Elbow Method
##���s���ت��A�N�O�u�ϸs�����`�ܲ��̤p�F�ϸs�����`�ܲ��̤j�v�C
##���y�ܻ��A�ڭ̥u�n��X�@�ӼƦrn�A�ϱo��ƳQ����n�s�ɡA�s�����`�ܲ�(SSE)�|�̤p�A����n = �̨Ϊ����s�ƥ�(optimal number for clusters)�I
##�bfactoextra���M��̡A�w�g���ڭ̼g�n�禡fviz_nbclust()�A�i�H���ڭ̹��Elbow Method�C
##�禡fviz_nbclust()�A�O���ggplot2���y�k�A�NElbow Method�����G��ı�ơA
##�����M�D�������R�����~�Y��(scree plot)�X�G�@�Ҥ@�ˡC
require(factoextra)
#Elbow Method�B�Φb���h�����R
#hcut()�ݩ�factoextra�M��A�ëD�W�zhclust()�C
fviz_nbclust(iris_for_clustering,
		 FUNcluster=hcut,       ##hierarchical clustering�A�]�i�H�ϥ�kmeans, pam, hcut, clara,...
	 	 method="wss",	      ##total within sum of square
		 k.max=12		      ##max number of clusters to consider
		 )+
labs(title="Elbow Method for HC")+
geom_vline(xintercept=3, ##�bX=3���a��A
	     linetype=2)   ##�e�@����u�C

par(mfrow=c(1,2))

##Elbow Method ���Φb K-Means
fviz_nbclust(iris_for_clustering,
		 FUNcluster=kmeans,     ##hierarchical clustering�A�]�i�H�ϥ�kmeans, pam, hcut, clara,...
	 	 method="wss",	      ##total within sum of square
		 k.max=12		      ##max number of clusters to consider
		 )+
labs(title="Elbow Method for K-Means")+
geom_vline(xintercept=3,    		##�bX=3���a��A
	     linetype=2)   		##�e�@����u�C

##Elbow Method ���Φb K-Medoid
fviz_nbclust(iris_for_clustering,
		 FUNcluster=pam,        ##hierarchical clustering�A�]�i�H�ϥ�kmeans, pam, hcut, clara,...
	 	 method="wss",	      ##total within sum of square
		 k.max=12		      ##max number of clusters to consider
		 )+
labs(title="Elbow Method for K-Medoid")+
geom_vline(xintercept=3, 		##�bX=3���a��A
	     linetype=2)   		##�e�@����u�C

##Avg. Silhouette ���Φb K-Means
require(factoextra)
fviz_nbclust(iris_for_clustering,
		 FUNcluster=kmeans,	##K-Means
		 method="silhouette",   ##Avg. Silhouette
		 k.max=12			##max number of clusters to consider
		 )+
labs(title="Average Silhouette Method for K-Means") ##���B���̱���1���ƭȡC
#���������Ƚd��[-1, +1]�G
##�p�G�Y�@�˥�����������1�A�h�����˥��E�����G�X�z�F
##�p�G����-1�A�h����������Ӥ������L���L�F
##�p�G���������0�A�h�����Ӽ˥��b����L����ɤW�C
#########################################################################################################################