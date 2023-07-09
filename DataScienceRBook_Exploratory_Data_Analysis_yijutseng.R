#��������Ƥ��R (Exploratory Data Analysis) ���D�n�믫�O�B�ε�ı�ơB�򥻪��έp���u��A���Ъ�������ƯS�ʡA�����Ʃҥ]�t����T�B���c�M�S�I�A
#�]���b�i��������Y�Ԫ����R���e�A�����n���Ʀ���h�{�ѡA�~��q�w�諸��Ƥ��R��V�C

#��������Ƥ��R�]�A���R�U�ܼƶ������p�ʡA�ݬO�_���w�Ƥ��~������o�{�A�άO�[���Ƥ��e�O�_�ŦX�w���A
#�Y�_�A�ˬd��ƬO�_���~�A�̫��ˬd��ƬO�_�ŦX���R�e�����]�A�ѤW�z�i���A��������Ƥ��R�q�`���ݭn�Y�Ԫ����]�M�Ӹ`�e�{�A�D�n�\���٬O�y�[��z��ƪ��S�ʡC
#�b��ƶq�j�������ɭԡA��������Ƥ��R�N�D�`���n�A�]���z�L��������Ƥ��R�A���R�H���i�H�b�������έp�p��P�Ӯɪ��ҫ��إ߫e�A�N���o�{�i�઺���~�A
#�󭫭n���O�A�i�H�z�L�����ʤ��R�ӽվ���R����V�A��֦]���R��V���~�ҳy�����ɶ����O�C

#��������Ƥ��R����:
##�ϧΤ�Graphical �� �q��Quantitative
##���ܶqUnivariate �� ���ܶqBivariate �� �h�ܶqMultivariate
#�ϧΤƪ����R�覡�]�A���ϻP�C���A�q�ƪ����R�覡�h�O��ƪ�B�έp�A���Ҳյۭ���q�ƪ����R�覡�A�ϧΤƪ����R�覡�аѦ�Visualization�C

#�H���ܶq���R�ӻ��A�q�ƪ����R�覡�i�]�t�G
##�p�ⶰ���Ͷ� (����ʬ�)
###������ Mean mean()
###����� Median median()
###���� Mode�AR�L���ب�ơA�i������table()��X�{���Ƴ̦h�����
##�p���Ƥ����{��
###�̤p�� Min min()
###�̤j�� Max max()
###�d�� Range range()
###�|����t Quartiles quantile()
###�ܲ��� Variance var()
###�зǮt Standard deviation sd()

#�H���ܶq���R�ӻ��A���R�覡�i�]�A:
##�C�p�� Crosstabs table(), ftable(), prop.table()
##�@�ܼ� Covariance cov()
##������ Correlation cor()

#�q�Ƥ��R�覡�����q�Ȥj�h�i��R�����ب�Ƨ����p��A���O�b���������R�ɡA�`�`�ݭn�J���Ƥ��ժ����R���ΡA
#�Y�u�ΰ򥻪����ب�ƭp��A�ݭn��������Ƥ��թΤl����A�A�@�i�@�B���B��A�۷��ӮɡA���F�ϳo����Ƥ��ջP���R���u�@��e���Q�����A
#���Ѧb���б�������Ƥ��R�ɷ|�f�t����data.table�Mdplyr packages�A
#�o���packages�U���u�I�A�i�̭ӤH�A�X�ʿ�ΡC

#data.table#############################################################################################################
#data.tableŪ���j����ƪ��t�פ�ϥ�data.frame�֤W�ƭ��C
#install.packages("data.table")
library("data.table") ##���J
#fread("FILENAME") ##Ū����ƨ��
library("SportsAnalytics")
library("data.table")
NBA1516 = fetch_NBAPlayerStatistics("15-16")
NBA1516DT = data.table(NBA1516) ##NBA1516��data.frame
class(NBA1516)
class(NBA1516DT) ##"data.table" "data.frame"
#�ഫ�᪺NBA1516DT��ƫ��A��data.table�H��data.frame�A
#�o�O�]��data.table�Odata.frame��Ʈث��O�������A
#�ҥH�u�n�Odata.table���A����ơA�N�@�w�P�ɷ|�Odata.frame���A�C

#data.table��ƫ��A�㦳�S�����c�M�y�k�]�p�A�Q������Ƥ��R�B�z�A�򥻻y�k���c�p�U�G
#DT[i,j,by=]
##i  �[���(Row)�z���޿�
##j  �һ����(Column)
##by ���ը̾�
#�U�Ѽƶ��ݭn�H�r��,�Ϲj�A���Y�u�ݨϥΫe��ѼơA��誺,�i�ٲ��A�p�u�ݨϥ�i�Mj��ӰѼơA�i�H�g��DT[i,j]�C�U�Ѽƪ��ϥΤ�k���z�p�U�G
#i �[��ȿz���޿�
##�Ĥ@�ӰѼ�i�O�Ψӿz���[��ȡA�]�N�O�w��C(Row)���l���C
##�z��覡�i�z�L���L�Ȫ��V�q�άO��������(index)�V�q���w�z�����A�z�L�[��Ȫ��z��A�i�O�d�ݭn����ơA�i�������R�C
NBA1516DT[grepl('James',Name)]
NBA1516DT[grepl("A",Name)&Position=="C"]
str(NBA1516DT)
NBA1516DT[GamesPlayed>80] ##������ܪk�GNBA1516DT[NBA1516$GamesPlayed>80]
#j ����ܹB��
##�ĤG�ӰѼ�j�O�ΨӨM�w��X���A��X�����i�H�O��l���A�]�i�H�O�p��᪺���C
NBA1516DT[,mean(GamesPlayed)] ##�]���S���z��ݨD�A�r���e��d�šC
NBA1516DT[,.(mean(GamesPlayed),mean(PersonalFouls),mean(Steals))] ##�@���p��h�ӼƭȡA���ɲĤG�����j�ݭn�ϥ�.()�]�_�ӡC
##    V1  V2 V3
## 1: 55 105 41
##��X���Ʀr�۰ʳQ�[�W���W��V1, V2, V3
#�b�p��s���ɡA�i�H�b�s���w�q���e��[�W���W��=�A�P�ɴ������W�r�A�p�U�G
NBA1516DT[,.(GamesPlayedMean=mean(GamesPlayed),
             PersonalFoulsMean=mean(PersonalFouls),
             StealsMean=mean(Steals))]
NBA1516DT[,.(GamesPlayedMax=max(GamesPlayed), ##�̤j��
             ThreesMadeMin=min(ThreesMade), ##�̤p��
             FieldGoalsMadeSD=sd(FieldGoalsMade))] ##�зǮt
NBA1516DT[GamesPlayed>70,.(ThreesMadeMean=mean(ThreesMade),FieldGoalsMadeMean=mean(FieldGoalsMade))] ##�p��X�Ҧ��X���Ƥj��70���y���A������i�X���T���y�P����y�C
#by ���ը̾�
##�ĤT�ӰѼ�by�����խp�⪺�̾ڡA�|�Ҩӻ��A�ڭ̥i�H�p��NBA�U�����y���ƻP�����U��ơA
##�y���Ӽƪ��p��bdata.table���i�ϥ�.N���O�A�����ϥ�mean()��ơA���ɥu�n�bby=���[�W���ը̾�(�U��Team)�A�Y�i�����B��C
NBA1516DT[,.(.N,AssistsMean=mean(Assists)),by=Team] ##.N�bdata.table���O�O�d�r�A�Ψӭp��ӼơC
NBA1516DT[Position=="C",.(.N,ThreesAttemptedMean=mean(ThreesAttempted)),by=Team]

#dplyr##################################################################################################################
#dplyr�ϥΥH�U��Ƥ��R��z��ơG
## select(): ��n���R�����A���l�� (Column)
## filter(): ��n���R���[��ȡA�[��Ȥl�� (Row)
## mutate(): �W�[�s���
## summarise(): �p��έp��
## group_by(): ���ը̾� ##�P�\��DT[,,by=]
## arrange(): �[��ȱƧ�
## rename(): ��쭫�s�R�W
## %>%: the ��pipe�� operator �s���W�ƨ禡�A�N�Ҧ��禡�p���b�@�_����
#install.packages("dplyr") ##�w��
library(dplyr) ##���J
library(SportsAnalytics)
NBA1516 = fetch_NBAPlayerStatistics("15-16")
#select()
##�ϥ�select()�禡�i��n���R�����A�]�N�O�w�����(Column)���l���C
##�禡�ϥΤ覡��select(��ƦW��,������1,������2,...)�A�䤤����1�P����2�O�ϥΩΪ��s�������C
##�t�~dplyr���ѴX�Ӥ�K�z��W�٪��禡�G
## starts_with()
## ends_with()
## contains()
## matches()
## num_range()
## one_of()
## everything()
#�Բӻ����i�bR�����������J?select_helpers�d�ݡC
select1 = select(NBA1516,Name,starts_with("Threes"),starts_with("FieldGoals"))
##���P��
##select1 = NBA1516[,c("Name","ThreesMade","ThreesAttempted","FieldGoalsMade","FieldGoalsAttempted")] ##�z�����
head(select1)
select2 = select(NBA1516,Name:FreeThrowsAttempted) ##��:��s���W�١A�z�����Name�����FreeThrowsAttempted�����Ҧ����C
##���P��NBA1516[,2:12]
head(select2)
select3<-select(NBA1516,Name:FreeThrowsAttempted,-GamesPlayed) ##��-�������W��GamesPlayed�C
##���P��NBA1516[,c(2:4,6:12)]
head(select3)
#filter()
##�ϥ�filter()�禡�i��n���R���[��ȡA�]�N�O�w��C(Row)���l���A�ϥΤ�k��filter(��ƦW��,�z�����)
filter1 = filter(NBA1516,TotalMinutesPlayed>2850) ##�z��X�������ƶW�L2850�������y����ơC
##���P��
filter1 = NBA1516[NBA1516$TotalMinutesPlayed>2850,] ##�z��C
#A %in% B�GA �O�_�b B ���C
filter2 = filter(NBA1516,Team %in% c("BOS","SAN")) ##�t��B�� (Matching operator, binary, in model formulae: nesting)
head(filter2)
filter3 = filter(NBA1516,FieldGoalsMade/FieldGoalsAttempted>0.7)
filter3
#�i�ϥ� &(�P)�B|(��)���Ÿ���s�޿�z�����C
filter4 = filter(NBA1516,FieldGoalsMade/FieldGoalsAttempted>0.7 & GamesPlayed>30)
filter4
#summarise()�G�Ψӭp��έp��
summary1 = summarise(NBA1516,
                     Player_number=n(),                    ##�y���Ӽ�
                     Team_number=n_distinct(Team),         ##�����ƶ����
                     Position_type=n_distinct(Position))   ##�����Ʋy����m��
summary1
filter1 = filter(NBA1516,TotalMinutesPlayed>2500)
filter1
summary2 = summarise(filter1,
                     Player_number=n(),
                     FieldGoalsMadeMean=mean(FieldGoalsMade),
                     FieldGoalsAttemptedMean=mean(FieldGoalsAttempted))
summary2
#�W�z���R�y�{�]���z��A�`�M�^�A�i������pipe�Ÿ�%>%�N���O��s�A��ּȦs����]filter1�^���ͦ��A�D�n�����O"���z���p��"�C
summary3=filter(NBA1516,TotalMinutesPlayed>2500) %>%
         summarise(Player_number=n(),
                   FieldGoalsMadeMean=mean(FieldGoalsMade),
                   FieldGoalsAttemptedMean=mean(FieldGoalsAttempted))
summary3
#group_by()�G�]�w���ը̾ڡA�P�\��DT[,,by=]�A�q�`�|�Psummarise()�禡�X�֨ϥΡC
group1 = group_by(NBA1516,Team) %>% summarise(Player_number=n(),FieldGoalsMadeMean=mean(FieldGoalsMade),FieldGoalsAttemptedMean=mean(FieldGoalsAttempted))
#�p��U���]�HTeam�@�����ը̾ڡ^���y���ơB������i������y�ƥH�Υ�����X������y�ơC
group1
# `summarise()` regrouping output by 'Team' (override with `.groups` argument)
head(group1)
group2 = group_by(NBA1516,Team,Position) %>% summarise(Player_number=n(),FieldGoalsMadeMean=mean(FieldGoalsMade),FieldGoalsAttemptedMean=mean(FieldGoalsAttempted))
head(group2)
#arrange()�G�Ƨǥ\��A�w�]�����W�ƧǡC
arrange1 = arrange(NBA1516,TotalMinutesPlayed)
head(arrange1)
arrange2 = arrange(NBA1516,desc(TotalMinutesPlayed),desc(GamesPlayed))
head(arrange2)
#���Xgroup_by()�Bsummarise()�Barrange()�A�i�����@�s�ꪺ��Ƥ��R�C
result = group_by(NBA1516,Team,Position) %>% 
         summarise(Player_number=n(),
                   FieldGoalsMadeMean=mean(FieldGoalsMade),
                   FieldGoalsAttempted=mean(FieldGoalsAttempted)) %>% 
         arrange(desc(FieldGoalsMadeMean))
head(result)
#�p��U���U�u�Ʀ�m�]�HTeam�MPosition�@�����ը̾ڡ^���y���ơB������i������y�ƥH�Υ�����X������y�ơA�è̥�����"�i"������y�ƥѤj��p�ƧǡC
#rename()�G�s�W��=�¦W��
rename1 = rename(NBA1516,Po=Position)
rename1[1:5,1:5]