#[��Ƶ�ı��]

#��Ƶ�ı�ƪ��ت�##################################################################################################
#���򱴯�����Ƥ��R�A��������Ƥ��R�i�����ϧΤ�(Graphical)�ζq��(Quantitative)���R�A
#�`�A�ӻ��@�Ϫ��ت���:
##�F�Ѹ�ƪ��S��(���O��ơB�ƭȸ�ơH)
##�M���ƪ��Ҧ�(patterns)
##��ĳ��Ƥ��R�P�ؼҪ�����
##���G�e�{�P���q

#�䤤�e�T���ݩ󱴯��� (Exploratory graphs)�F���G�e�{�P���q�ݩ󵲪G�� (Final graphs)�G
#�������ݱ�������Ƥ��R�A�ت��O�b�y�ݡz�P�y�[��z��ƪ��ˤl�A�ҥH�����Ϧ��H�U�S��:
##�ܧִN�i�H���@�i��
##�����L�{���A�i��i�H����
##�D�n�ت��O�İǻP�F�Ѹ�ƪ������P�˻�
##���ΰ��ϧή榡�վ����

#�Ӧb�s�@���G�� (Final graphs)�ɡA�h���Ҽ{�H�U�ƶ�:
##����A�e�{�t���G
###�������H�ָ�֤���H
##�e�{�]�G���Y�]causality�^,����]mechanism�^,���G�����]explanation�^,�t�Τƪ����c�]systematic structure�^�G
###�]�G�ҫ��H������A�Q�n���o�˪�����C
##�e�{�h�ܼơ]Multivariate�^��ơG
###�h�ܼơ]Multivariate�^�G�W�L����ܼƴN�s�h�ܼ�
###�Ҧ��u��ƥ󳣬O�h�ܼƪ�
##�N�Ҿھ�X�e�{�G
###�b�P�@�ӵe���e�{��r�B�Ʀr�B�v���B�Ϫ�
###�ɶq�ιϧΧe�{���
##�N�Ϫ����A�����аO�P�����A�]�Axy�b�W�١B���B��ƨӷ����G
###��ƹϪ������i�H�e�{�A�Q�����G��
##���e�~�O�̭��n���G
###��Ƥ��n�A���R���n�A�Ϫ��A���]�S����!!!

#�bR���A���T�ӱ`�Ϊ��e�ϮM��A�]�A�G�򥻥\��(Base)�Blattice�H��ggplot2�C
#�ѩ�U�M��ø���޿褣�P�A���B�ϥγ̱`����ggplot2�M��C
#####################################################################################################################
#ggplot2 (Wickham, Chang, et al. 2020)���}�o�F�P�Ӧ۩�Dr. Leland Wilkinson��Grammar of Graphics
##��In brief, the grammar tells us that a statistical graphic is a mapping from data to aesthetic attributes (colour, shape, size) of geometric objects (points, lines, bars). The plot may also contain statistical transformations of the data and is drawn on a specific coordinate system��
##-from ggplot2 book.

#²��ӻ��A���Ϫ���k�]�A��ӳ̥D�n�����G
##Aesthetic attributes(�f���ݩ�)�G�]�A�C��B�Ϊ��B�I���j�p�P�u���ʲӵ��C
##Geometric objects(�X�󪫥�)�G�]�A�I�B�u�B�����ϡB�����ϵ��C
#��L�����]�A�G
##Facets�G���Ѧb�P�@�i�Ϥ����h�Ӥl�Ϫ���k�A�u�n�ϥ�Faceting�\��]�w�l�Ϥ������̾ڰѼƧY�i�C
##Stats�G�N��ư��έp�ഫ�C
##Scales�G�ק��I�u���C��B�Ϊ��Bxy�b���d�򵥡C

#�b�}�l��ggplot2���֤ߥ\�ध�e�Aqplot()�Oggplot2 Package���ѳ̰򥻪��e�Ϥ�k�A��򥻪�plot() function�ܱ���A���Ѥ@��²��J������k�C
#qplot()
##qplot()��ggplot2 "Hello, world!"
#qplot(x�b�W��,y�b�W��,data=�ϥθ��)�G
##���ܼơG���G�ϡC
##���ܼơG����ϡC

#install.packages("SportsAnalytics")
library(SportsAnalytics)
#install.packages("ggplot2")
library(ggplot2)
NBA1516 = fetch_NBAPlayerStatistics("15-16") ##Ū�J���

qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516)
#��k���Ĥ@�ӥD�n����Aesthetics�G�]�A�C��B�Ϊ��B�I���j�p�P�u���ʲӵ��C
qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516, color=Position) ##�[�Wcolor=Position���O�A���ܥΦu�Ʀ�mPosition�ۦ�C
#��k���ĤG�ӥD�n����Geometric�G�]�A�I�B�u�B�����ϡB�����ϵ��C
qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516, geom=c("point","smooth"))
##�[�Wgeom = c("point", "smooth")���O�A�b�ϤW�[�I�P���i�u�C
#�p�G��J���ܶq�ëD���ܶq�A�ӬO���ܶq�ɡA�w�]�ϧη|�q���G���ܬ�Histograms����ϡI
qplot(TotalPoints, data=NBA1516, fill=Position) ##�eTotalPoints�������/ fill = Position �åΦu�Ʀ�mPosition�ۦ�C

#�@�Ϫ�Facets�����i���Ѧb�P�@�i�Ϥ����h�Ӥl�Ϫ���k�A�u�n�ϥ�facets =�ӳ]�w�l�Ϥ������̾ڰѼƧY�i�C
#�H�U�Ϭ��ҡA��J���ܶq�O���ܶq�A�ҥH�w�]�ϧά����G�ϡC
#�]�w�l�Ϫ��y�k�����V����~��V�����G
##���V�����N���H�W�[�C�]Row�^���覡�e�l�ϡF
##��V�����N���H�W�[��]Column�^���覡�e�l�ϡC
#�q�`�u�|�]�w��@��V�A�p�G��ܪ��O���V�A��V���������i��.���ܡF�p�G��ܪ��O��V�A���V���������i��.���ܡC
qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516, facets=.~Position) ##facets = .~Position�G�Φu�Ʀ�mPosition���s�e��(��V)�C
qplot(FieldGoalsAttempted, TotalPoints, data=NBA1516, facets=Position~.) ##facets = Position~.�G�Φu�Ʀ�mPosition���s�e��(���V)�C
qplot(TotalPoints, data=NBA1516, facets=Position~., binwidth=2) ##binwidth=2�G�C2���@�աC
qplot(TotalPoints, data=NBA1516, facets=Position~., binwidth=10) ##binwidth=2�G�C10���@�աC
#qplot()���ѧֳt��K���e�ϥ\��A�åB�O�d�����ѼƳ]�w���u�ʡF���Y�ݭn�վ��h�ѼơA�����ϥΧ��㪺ggplot()�禡�C

#ggplot()##############################################################################################################
#�ϥ�ggplot2�@�Ϧ��H�U�B�J�G
##�ǳƦn��ơC
##�]�wAesthetic attributes�G�ϥ�aes(x, y, ...)���w�C
##���wGeometric objects�G�`�Ϊ��]�Ageom_point()�Bgeom_line()�Bgeom_histogram()�Bgeom_polygon()�Bgeom_errorbar()�C
#install.packages("ggplot2")
library(ggplot2)
df = data.frame(gp=factor(rep(letters[1:3], each=10)), y=rnorm(30)) ##���ͽd�ҵe�ϸ�ơC
#rep(x, times = 1, length.out = NA, each = 1)
##x �ϥΪ̷Q�n�ۦP���Ƥ������ƭȦV�q.
##times �ƭȦV�q x ���ƪ�����.
##each �ƭȦV�q x ���C�Ӥ������ƪ�����.
##length.out = NA �ƭȦV�q x ���ƫ᪺����.
df
ggplot(df, aes(x=gp,y=y))+geom_point() ##�]�w��ӵe�Ϫ����n����Aesthetic attributes�MGeometric objects�C
ggplot(df, aes(x=gp,y=y))+geom_boxplot() ##�]�w��ӵe�Ϫ����n����Aesthetic attributes�MGeometric objects�C

#Faceting�\��
df$z = df$y+rnorm(30) ##�w�qz��
?rnorm() ##rnorm(n, mean = 0, sd = 1)
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(gp~.) ##���V����
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(.~gp) ##��V����
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(gp~.)+geom_smooth() ##�ϥ�geom_smooth()��xy���G�ϥ[�W�Ͷսu
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(.~gp)+geom_smooth()
ggplot(df, aes(x=z,y=y))+geom_point()+facet_grid(gp~.)+geom_smooth(method="lm") ##�ϥ�geom_smooth()��Linear Regression��k�A��xy���G�ϥ[�W�Ͷսu
#�H�U�T�ت��ܪk�ҦP�\�G
##geom_smooth(method=lm)
##geom_smooth(method='lm')
##geom_smooth(method="lm")
ggplot(df, aes(x=z,y=y))+geom_line()+facet_grid(gp~.)
#���C����աA�ϥ�aes(color='group name')�G
ggplot(df, aes(x=z,y=y,color=gp))+geom_line()+facet_grid(gp~.) ##gp���ϥ�""�A�_�ӡC

#�e�ϫe�ݭn�`�N���X�Ӥp�a��G
##���Ѹ�ƮɡA���ƭקאּ�Q�n�b�Ϥ���ܪ���r�C�q�W�����d�ҥi�H�o�{�Aggplot2�|�����N��Ƥ��ա]a/b/c�^�����Цb�ϤW�A�P�䤧��A�ӧ�ϡA���p�b��ƳB�z�ɴN�Na/b/c�אּ���N�q�B�i�H�����ϥΪ���r�C
##�p�G�O�����ʪ���ơA���o�S�O�ƭȮɡ]���O1,2,3�^�i�H��factor()�ഫ�Aggplot�|�Nfactor����������ơC

#���F�򥻪��s�ϥ~�Aggplot2�M��]���ѧ��㪺��ƼХܳ]�w�P��L�ѼƳ]�w�\��A�]�A�G
## ���� xlab(), ylab(), labs(x=,y=), ggtitle()
## �C�@��geom_*()�����Ѽƥi�]�w
## �ϧμ˦��]�w theme()�A�i�ϥΤ��ؼ˦�
### theme_gray(): �ǭI���A�w�]�˦�
### theme_bw(): �¥ռ˦�
## �ϥΨ�L�˦��M��
### ggthemes
### xkcd

#�b����h�ժ������Ȱ��C�ɡA�]���U�ռ˥��ƻP��Ƥ��G���P�A�����ƪ��~�t�Ȥ]�|���P�A
#�ҥH�b��Ƶ�ı�ƮɡA��ĳ�[�W�~�t�u(Error bar)�A�~�t�u�q�`�ϥΦbbar chart�Mline chart�A�ӻ~�t�Ȫ��p�⦳�U�C�T�ؿ�ܡG
##Standard deviation (SD) �зǮt�G�e�{"��ƥ���"�ɨϥΡC
##Standard error (SE) �зǻ~�t�G�e�{�w�������Ȫ�"�i��~�t"�ɨϥΡC
##Confidence interval (CI) �H��϶��G�e�{�w�������Ȫ�"�H��"�ɨϥΡC
library(datasets)
library(data.table)
airquality$Month = as.factor(airquality$Month) ##�NMonth�ର�]�l�ܼơC�p�G�O�����ʪ���ơA���o�S�O�ƭȮɡ]���O1,2,3�^�i�H��factor()�ഫ�Aggplot�|�Nfactor����������ơC
airquality.mean = data.table(airquality)[,.(OzoneMean=mean(Ozone,na.rm=T)),by=Month] ##�p��C��Ozone�����C
#na.rm=T�A���ܱNna��remove�C
ggplot()+geom_bar(data=airquality.mean, aes(x=Month,y=OzoneMean), stat="identity") ##stat="identity"�����e�Ʀr�C
#�bggplot2�M�󤤡A�[�Wgeom_errorbar()�禡�A�]�w��ư��C�ȡA��b��Ϥ��K�[�~�t�u�C
airquality.stat = data.table(airquality)[,.(OzoneMean=mean(Ozone,na.rm=T),OzoneSD=sd(Ozone,na.rm=T)),by=Month] ##�p��C��Ozone�����P�зǮt�C
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