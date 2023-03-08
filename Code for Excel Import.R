library(readxl)
df <- read_excel("H:\\Meta-Rep\\Inhaltsanalyse Auswertung\\Data\\data_MetaRep_merged with ICR_1.xlsx", col_names = c(
  "CASE","SERIAL","REF","QUESTNNR","MODE","STARTED","A001_01","A002_01","A004_01",
  "A005_01","A006_01","A007","A007_01","A007_02","A007_03","A007_04","A008",
  "A008x01","A008x02","A008x03","A008x04","A008x05","A009_01","A011","A202",
  "A203","A203s","A204","A205_01","A206_01","A207","A207_01","A207_02","A207_03",
  "A207_04","A207_05","A207_06","A207_06a","A207_07","A207_07a","A207_08",
  "A207_09","A207_10","A207_10a","A207_11","A207_12","A207_12a","A207_13",
  "A207_13a","A207_14","A208","A208_01","A209","A209_01","A210","A211_01","A212",
  "A212_07","A212_08","A213_01","A214","A214x01","A214x02","A214x03","A215",
  "A215_01","A216_01_CN","A216_01_1","A216_01_2","A216_01_3","A216_02_CN",
  "A216_02_1","A216_02_2","A216_02_3","A216_03_CN","A216_03_1","A216_03_2",
  "A216_03_3","A216_04_CN","A216_04_1","A216_04_2","A216_04_3","A216_05_CN",
  "A216_05_1","A216_05_2","A216_05_3","A216_06_CN","A216_06_1","A216_06_2",
  "A216_06_3","A217","A217x01","A217x02","A301","A301_03","A302","A302_01","A304",
  "A304_06","A304_07","A305_01","A309","A309_01","A307","A307_01","A308",
  "A308_01","TIME001","TIME002","TIME003","TIME_SUM","MAILSENT","LASTDATA",
  "FINISHED","Q_VIEWER","LASTPAGE","MAXPAGE","MISSING","MISSREL","TIME_RSI",
  "DEG_TIME"))
df <- df[-c(1,2),]

my_df <- as.data.frame(df, colClasses = c(
  CASE="numeric", SERIAL="character", REF="character", QUESTNNR="character",
  MODE="factor", STARTED="POSIXct", A001_01="character", A002_01="character",
  A004_01="character", A005_01="character", A006_01="character",
  A007="numeric", A007_01="logical", A007_02="logical", A007_03="logical",
  A007_04="logical", A008="numeric", A008x01="character", A008x02="character",
  A008x03="character", A008x04="character", A008x05="character",
  A009_01="character", A011="numeric", A202="numeric", A203="numeric",
  A203s="character", A204="numeric", A205_01="character", A206_01="character",
  A207="numeric", A207_01="logical", A207_02="logical", A207_03="logical",
  A207_04="logical", A207_05="logical", A207_06="logical",
  A207_06a="character", A207_07="logical", A207_07a="character",
  A207_08="logical", A207_09="logical", A207_10="logical",
  A207_10a="character", A207_11="logical", A207_12="logical",
  A207_12a="character", A207_13="logical", A207_13a="character",
  A207_14="logical", A208="numeric", A208_01="character", A209="numeric",
  A209_01="character", A210="numeric", A211_01="character", A212="numeric",
  A212_07="character", A212_08="character", A213_01="character",
  A214="numeric", A214x01="character", A214x02="character",
  A214x03="character", A215="numeric", A215_01="character",
  A216_01_CN="numeric", A216_01_1="logical", A216_01_2="logical",
  A216_01_3="logical", A216_02_CN="numeric", A216_02_1="logical",
  A216_02_2="logical", A216_02_3="logical", A216_03_CN="numeric",
  A216_03_1="logical", A216_03_2="logical", A216_03_3="logical",
  A216_04_CN="numeric", A216_04_1="logical", A216_04_2="logical",
  A216_04_3="logical", A216_05_CN="numeric", A216_05_1="logical",
  A216_05_2="logical", A216_05_3="logical", A216_06_CN="numeric",
  A216_06_1="logical", A216_06_2="logical", A216_06_3="logical",
  A217="numeric", A217x01="character", A217x02="character", A301="numeric",
  A301_03="character", A302="numeric", A302_01="character", A304="numeric",
  A304_06="character", A304_07="character", A305_01="character",
  A309="numeric", A309_01="character", A307="numeric", A307_01="character",
  A308="numeric", A308_01="character", TIME001="integer", TIME002="integer",
  TIME003="integer", TIME_SUM="integer", MAILSENT="POSIXct",
  LASTDATA="POSIXct", FINISHED="logical", Q_VIEWER="logical",
  LASTPAGE="numeric", MAXPAGE="numeric", MISSING="numeric", MISSREL="numeric",
  TIME_RSI="numeric", DEG_TIME="numeric"
))

# Variable und Value Labels
my_df$A011 = factor(my_df$A011, levels=c("1","2","-9"), labels=c("Laura","Philipp","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A202 = factor(my_df$A202, levels=c("1","2","3","4","5","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","-9"), labels=c("Media content","Trace data","Self-reported data","other types of data","no data set","Media content - text incl. newspaper articles data","Media content - image data","Media content - video data","Media content - audio data","Media content - posts, tweets, comments","Media content - forum contributions ","Media content - website data incl. internet archive, etc.","Trace data - tracking data","Trace data - sensory data","Trace data - popularity cues incl. likes/reactions/clicks","Trace data - search engine data","Trace data - smartphone data","Trace data - follows","Trace data - website visits","Trace data - other","Self-reported data - survey data","Self-reported data - interview data","Self-reported data - group discussion data","Self-reported data - other (includes experiments)","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A203 = factor(my_df$A203, levels=c("1","2","3","4","5","6","7","8","9","-2","-9"), labels=c("Twitter","Facebook","Telegram","websites","Self-report","Youtube","Reddit","Instagram","no data set","[NA] sonstige Texteingabe","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A204 = factor(my_df$A204, levels=c("1","2","3","4","-9"), labels=c("Primary","Secondary","Both","n/a & no data set","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A208 = factor(my_df$A208, levels=c("1","2","-9"), labels=c("Yes","No","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A209 = factor(my_df$A209, levels=c("1","2","-9"), labels=c("Yes","No","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A210 = factor(my_df$A210, levels=c("1","2","3","4","5","-9"), labels=c("Yes","Yes, partially","Yes, available upon request","No","n/a","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A212 = factor(my_df$A212, levels=c("1","2","3","4","5","6","7","8","-9"), labels=c("Article appendix","Author website","<3>","Institutional repository","Journal online appendix","Journal repository","Public repository","Other","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A215 = factor(my_df$A215, levels=c("1","2","-9"), labels=c("Yes","No","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A301 = factor(my_df$A301, levels=c("1","2","3","4","5","-9"), labels=c("Yes","<2>","Yes, partially","No","n/a","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A302 = factor(my_df$A302, levels=c("1","2","-9"), labels=c("Yes","No","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A304 = factor(my_df$A304, levels=c("1","2","3","4","5","6","7","8","-9"), labels=c("Article appendix","Author website","Available upon request","Journal online appendix","Journal repository","Institutional repository","Public repository","Other","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A309 = factor(my_df$A309, levels=c("1","2","-9"), labels=c("Yes","No","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A307 = factor(my_df$A307, levels=c("1","2","3","-9"), labels=c("Yes","<2>","No","[NA] nicht beantwortet"), ordered=FALSE)
my_df$A308 = factor(my_df$A308, levels=c("1","2","-9"), labels=c("Yes","No","[NA] nicht beantwortet"), ordered=FALSE)

my_df$A007_01 <- as.factor(my_df$A007_01)
levels(my_df$A007_01) <- c("No", "Yes")

my_df$A007_02 <- as.factor(my_df$A007_02)
levels(my_df$A007_02) <- c("No", "Yes")

my_df$A007_03 <- as.factor(my_df$A007_03)
levels(my_df$A007_03) <- c("No", "Yes")

my_df$A007_04 <- as.factor(my_df$A007_04)
levels(my_df$A007_04) <- c("No", "Yes")

my_df$A207_01 <- as.factor(my_df$A207_01)
levels(my_df$A207_01) <- c("No", "Yes")

my_df$A207_02 <- as.factor(my_df$A207_02)
levels(my_df$A207_02) <- c("No", "Yes")

my_df$A207_03 <- as.factor(my_df$A207_03)
levels(my_df$A207_03) <- c("No", "Yes")

my_df$A207_04 <- as.factor(my_df$A207_04)
levels(my_df$A207_04) <- c("No", "Yes")

my_df$A207_05 <- as.factor(my_df$A207_05)
levels(my_df$A207_05) <- c("No", "Yes")

my_df$A207_06 <- as.factor(my_df$A207_06)
levels(my_df$A207_06) <- c("No", "Yes")

my_df$A207_07 <- as.factor(my_df$A207_07)
levels(my_df$A207_07) <- c("No", "Yes")

my_df$A207_08 <- as.factor(my_df$A207_08)
levels(my_df$A207_08) <- c("No", "Yes")

my_df$A207_09 <- as.factor(my_df$A207_09)
levels(my_df$A207_09) <- c("No", "Yes")

my_df$A207_10 <- as.factor(my_df$A207_10)
levels(my_df$A207_10) <- c("No", "Yes")

my_df$A207_11 <- as.factor(my_df$A207_11)
levels(my_df$A207_11) <- c("No", "Yes")

my_df$A207_12 <- as.factor(my_df$A207_12)
levels(my_df$A207_12) <- c("No", "Yes")

my_df$A207_13 <- as.factor(my_df$A207_13)
levels(my_df$A207_13) <- c("No", "Yes")

my_df$A207_14 <- as.factor(my_df$A207_14)
levels(my_df$A207_14) <- c("No", "Yes")

my_df$A216_01_1 <- as.factor(my_df$A216_01_1)
levels(my_df$A216_01_1) <- c("No", "Yes")

my_df$A216_01_2 <- as.factor(my_df$A216_01_2)
levels(my_df$A216_01_2) <- c("No", "Yes")

my_df$A216_01_3 <- as.factor(my_df$A216_01_3)
levels(my_df$A216_01_3) <- c("No", "Yes")

my_df$A216_02_1 <- as.factor(my_df$A216_02_1)
levels(my_df$A216_02_1) <- c("No", "Yes")

my_df$A216_02_2 <- as.factor(my_df$A216_02_2)
levels(my_df$A216_02_2) <- c("No", "Yes")

my_df$A216_02_3 <- as.factor(my_df$A216_02_3)
levels(my_df$A216_02_3) <- c("No", "Yes")

my_df$A216_03_1 <- as.factor(my_df$A216_03_1)
levels(my_df$A216_02_3) <- c("No", "Yes")

my_df$A216_03_2 <- as.factor(my_df$A216_03_2)
levels(my_df$A216_03_2) <- c("No", "Yes")

my_df$A216_03_3 <- as.factor(my_df$A216_03_3)
levels(my_df$A216_03_3) <- c("No", "Yes")

my_df$A216_04_1 <- as.factor(my_df$A216_04_1)
levels(my_df$A216_04_1) <- c("No", "Yes")

my_df$A216_04_2 <- as.factor(my_df$A216_04_2)
levels(my_df$A216_04_2) <- c("No", "Yes")

my_df$A216_04_3 <- as.factor(my_df$A216_04_3)
levels(my_df$A216_04_3) <- c("No", "Yes")


my_df$A216_05_1 <- as.factor(my_df$A216_05_1)
levels(my_df$A216_05_1) <- c("No", "Yes")

my_df$A216_05_2 <- as.factor(my_df$A216_05_2)
levels(my_df$A216_05_2) <- c("No", "Yes")

my_df$A216_05_3 <- as.factor(my_df$A216_05_3)
levels(my_df$A216_05_3) <- c("No", "Yes")

my_df$A216_06_1 <- as.factor(my_df$A216_06_1)
levels(my_df$A216_06_1) <- c("No", "Yes")

my_df$A216_06_2 <- as.factor(my_df$A216_06_2)
levels(my_df$A216_06_2) <- c("No", "Yes")

my_df$A216_06_3 <- as.factor(my_df$A216_06_3)
levels(my_df$A216_06_3) <- c("No", "Yes")

comment(my_df$SERIAL) = "Seriennummer (sofern verwendet)"
comment(my_df$REF) = "Referenz (sofern im Link angegeben)"
comment(my_df$QUESTNNR) = "Fragebogen, der im Interview verwendet wurde"
comment(my_df$MODE) = "Interview-Modus"
comment(my_df$STARTED) = "Zeitpunkt zu dem das Interview begonnen hat (Europe/Berlin)"
comment(my_df$A001_01) = "1.1 Article Title: [01]"
comment(my_df$A002_01) = "1.2 Author Names: [01]"
comment(my_df$A004_01) = "1.3 Year of Publication: [01]"
comment(my_df$A005_01) = "1.4 Journal Title: [01]"
comment(my_df$A006_01) = "1.5 Author-tagged Keywormy_df: [01]"
comment(my_df$A007) = "1.6 Type of Research: Ausweichoption (negativ) oder Anzahl ausgewählter Optionen"
comment(my_df$A007_01) = "1.6 Type of Research: communicator-based"
comment(my_df$A007_02) = "1.6 Type of Research: recipient-based"
comment(my_df$A007_03) = "1.6 Type of Research: platform-based"
comment(my_df$A007_04) = "1.6 Type of Research: n/a"
comment(my_df$A008) = "1.7 Analysis method: Anzahl der Nennungen"
comment(my_df$A008x01) = "1.7 Analysis method: Nennung 1"
comment(my_df$A008x02) = "1.7 Analysis method: Nennung 2"
comment(my_df$A008x03) = "1.7 Analysis method: Nennung 3"
comment(my_df$A008x04) = "1.7 Analysis method: Nennung 4"
comment(my_df$A008x05) = "1.7 Analysis method: Nennung 5"
comment(my_df$A009_01) = "1.0 Paper ID: [01]"
comment(my_df$A011) = "A00R"
comment(my_df$A202) = "2.1 Types of data used"
comment(my_df$A203) = "2.2 Data source"
comment(my_df$A203s) = "2.2 Data source (offene Eingabe)"
comment(my_df$A204) = "2.3 Data origin"
comment(my_df$A205_01) = "2.4 Data collection time period: [01]"
comment(my_df$A206_01) = "2.5 Sample size: [01]"
comment(my_df$A207) = "2.6 Units of analysis: Ausweichoption (negativ) oder Anzahl ausgewählter Optionen"
comment(my_df$A207_01) = "2.6 Units of analysis: Individuals"
comment(my_df$A207_02) = "2.6 Units of analysis: Websites"
comment(my_df$A207_03) = "2.6 Units of analysis: Articles"
comment(my_df$A207_04) = "2.6 Units of analysis: Tweets"
comment(my_df$A207_05) = "2.6 Units of analysis: Links"
comment(my_df$A207_06) = "2.6 Units of analysis: Hashtags"
comment(my_df$A207_06a) = "2.6 Units of analysis: Hashtags (offene Eingabe)"
comment(my_df$A207_07) = "2.6 Units of analysis: Blogs"
comment(my_df$A207_07a) = "2.6 Units of analysis: Blogs (offene Eingabe)"
comment(my_df$A207_08) = "2.6 Units of analysis: Countries"
comment(my_df$A207_09) = "2.6 Units of analysis: Followers"
comment(my_df$A207_10) = "2.6 Units of analysis: Posts"
comment(my_df$A207_10a) = "2.6 Units of analysis: Posts (offene Eingabe)"
comment(my_df$A207_11) = "2.6 Units of analysis: URLs"
comment(my_df$A207_12) = "2.6 Units of analysis: Other"
comment(my_df$A207_12a) = "2.6 Units of analysis: Other (offene Eingabe)"
comment(my_df$A207_13) = "2.6 Units of analysis: Image"
comment(my_df$A207_13a) = "2.6 Units of analysis: Image (offene Eingabe)"
comment(my_df$A207_14) = "2.6 Units of analysis: no data set"
comment(my_df$A208) = "2.7 Data collection tools: are they reported"
comment(my_df$A208_01) = "2.7 Data collection tools: are they reported: Yes"
comment(my_df$A209) = "2.7 Data collection tools: Versions of the tool reported?"
comment(my_df$A209_01) = "2.7 Data collection tools: Versions of the tool reported?: Yes"
comment(my_df$A210) = "2.8 Data sharing"
comment(my_df$A211_01) = "2.0 Data Set ID: [01]"
comment(my_df$A212) = "2.9 Mode of data sharing"
comment(my_df$A212_07) = "2.9 Mode of data sharing: Public repository"
comment(my_df$A212_08) = "2.9 Mode of data sharing: Other"
comment(my_df$A213_01) = "2.10 Data Location: [01]"
comment(my_df$A214) = "2.11 Data format: Anzahl der Nennungen"
comment(my_df$A214x01) = "2.11 Data format: Nennung 1"
comment(my_df$A214x02) = "2.11 Data format: Nennung 2"
comment(my_df$A214x03) = "2.11 Data format: Nennung 3"
comment(my_df$A215) = "2.12 Data are documented yes/no"
comment(my_df$A215_01) = "2.12 Data are documented yes/no: Yes"
comment(my_df$A216_01_CN) = "2.13 Data description: Anzahl ausgewählter Optionen oder Code für Ausweichoption (falls < 0) für: Data are raw"
comment(my_df$A216_01_1) = "2.13 Data description: Data are raw/Yes"
comment(my_df$A216_01_2) = "2.13 Data description: Data are raw/No"
comment(my_df$A216_01_3) = "2.13 Data description: Data are raw/n/a"
comment(my_df$A216_02_CN) = "2.13 Data description: Anzahl ausgewählter Optionen oder Code für Ausweichoption (falls < 0) für: Data are processed"
comment(my_df$A216_02_1) = "2.13 Data description: Data are processed/Yes"
comment(my_df$A216_02_2) = "2.13 Data description: Data are processed/No"
comment(my_df$A216_02_3) = "2.13 Data description: Data are processed/n/a"
comment(my_df$A216_03_CN) = "2.13 Data description: Anzahl ausgewählter Optionen oder Code für Ausweichoption (falls < 0) für: Data are reduced"
comment(my_df$A216_03_1) = "2.13 Data description: Data are reduced/Yes"
comment(my_df$A216_03_2) = "2.13 Data description: Data are reduced/No"
comment(my_df$A216_03_3) = "2.13 Data description: Data are reduced/n/a"
comment(my_df$A216_04_CN) = "2.13 Data description: Anzahl ausgewählter Optionen oder Code für Ausweichoption (falls < 0) für: Data are aggregated"
comment(my_df$A216_04_1) = "2.13 Data description: Data are aggregated/Yes"
comment(my_df$A216_04_2) = "2.13 Data description: Data are aggregated/No"
comment(my_df$A216_04_3) = "2.13 Data description: Data are aggregated/n/a"
comment(my_df$A216_05_CN) = "2.13 Data description: Anzahl ausgewählter Optionen oder Code für Ausweichoption (falls < 0) für: Data are anonymized"
comment(my_df$A216_05_1) = "2.13 Data description: Data are anonymized/Yes"
comment(my_df$A216_05_2) = "2.13 Data description: Data are anonymized/No"
comment(my_df$A216_05_3) = "2.13 Data description: Data are anonymized/n/a"
comment(my_df$A216_06_CN) = "2.13 Data description: Anzahl ausgewählter Optionen oder Code für Ausweichoption (falls < 0) für: Data are pseudonomyzed"
comment(my_df$A216_06_1) = "2.13 Data description: Data are pseudonomyzed/Yes"
comment(my_df$A216_06_2) = "2.13 Data description: Data are pseudonomyzed/No"
comment(my_df$A216_06_3) = "2.13 Data description: Data are pseudonomyzed/n/a"
comment(my_df$A217) = "2.14 Data sharing obstacles: Anzahl der Nennungen"
comment(my_df$A217x01) = "2.14 Data sharing obstacles: Nennung 1"
comment(my_df$A217x02) = "2.14 Data sharing obstacles: Nennung 2"
comment(my_df$A301) = "3.1 Code shared"
comment(my_df$A301_03) = "3.1 Code shared: Yes, partially"
comment(my_df$A302) = "3.2 Other materials sharing"
comment(my_df$A302_01) = "3.2 Other materials sharing: Yes"
comment(my_df$A304) = "3.3 Mode of code sharing"
comment(my_df$A304_06) = "3.3 Mode of code sharing: Institutional repository"
comment(my_df$A304_07) = "3.3 Mode of code sharing: Public repository"
comment(my_df$A305_01) = "3.4 Location of the shared code: [01]"
comment(my_df$A309) = "3.5 Code is commented"
comment(my_df$A309_01) = "3.5 Code is commented: Yes"
comment(my_df$A307) = "3.6 Data analysis tools: are they reported"
comment(my_df$A307_01) = "3.6 Data analysis tools: are they reported: Yes"
comment(my_df$A308) = "3.6 Data analysis tools: Versions of the tool reported?"
comment(my_df$A308_01) = "3.6 Data analysis tools: Versions of the tool reported?: Yes"
comment(my_df$TIME001) = "Verweildauer Seite 1"
comment(my_df$TIME002) = "Verweildauer Seite 2"
comment(my_df$TIME003) = "Verweildauer Seite 3"
comment(my_df$TIME_SUM) = "Verweildauer gesamt (ohne Ausreißer)"
comment(my_df$MAILSENT) = "Versandzeitpunkt der Einladungsmail (nur für nicht-anonyme Adressaten)"
comment(my_df$LASTDATA) = "Zeitpunkt als der Datensatz das letzte mal geändert wurde"
comment(my_df$FINISHED) = "Wurde die Befragung abgeschlossen (letzte Seite erreicht)?"
comment(my_df$Q_VIEWER) = "Hat der Teilnehmer den Fragebogen nur angesehen, ohne die Pflichtfragen zu beantworten?"
comment(my_df$LASTPAGE) = "Seite, die der Teilnehmer zuletzt bearbeitet hat"
comment(my_df$MAXPAGE) = "Letzte Seite, die im Fragebogen bearbeitet wurde"
comment(my_df$MISSING) = "Anteil fehlender Antworten in Prozent"
comment(my_df$MISSREL) = "Anteil fehlender Antworten (gewichtet nach Relevanz)"
comment(my_df$TIME_RSI) = "Maluspunkte für schnelles Ausfüllen"
comment(my_df$DEG_TIME) = "Maluspunkte für schnelles Ausfüllen"



names(my_df) <- my_df[1,]

my_df <- my_df[-1,]



df <- read.csv(file = "H:\\Meta-Rep\\Inhaltsanalyse Auswertung\\Data\\data_MetaRep_merged with ICR_1_CSV.csv", sep = ",", encoding="UTF-8")


