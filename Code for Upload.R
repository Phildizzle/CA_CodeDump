# Plots for upload
# Requires one run-through of the R-script "Code for Excel Import"

library(stringr)
library(ggplot2)
library(sjmisc)
library(dplyr)
library(tidyr)


setwd("")


### Overview of Journal Titles###

JT<- as.data.frame(table(my_df$A005_01))

JT$Var1 <- tolower(JT$Var1)

Journals <- ggplot(JT, aes(x=Var1, y=Freq, fill = Var1))+
  geom_bar(stat = "identity", show.legend = FALSE) +
  ggtitle("Overview of Journal Titles")+
  geom_text(aes(label = Freq), vjust = -0.3) + 
  theme(plot.title = element_text(hjust = 0.5),axis.title.x = element_blank(), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Journals

ggsave(
  "Overview of Journal Titles.png",
  plot = Journals,
  device ="png",
  scale = 1,
  width = 14,
  height = 10,
  dpi = 1000
)

###Type of Research###

Type_of_Research <- c("communicator-based", "recipient-based", "platform-based")
my_df %>% group_by(A007_01) %>% summarise(no_rows = length(A007_01)) %>% pull(no_rows,1)
my_df %>% group_by(A007_02) %>% summarise(no_rows = length(A007_02)) %>% pull(no_rows,1)
my_df %>% group_by(A007_03) %>% summarise(no_rows = length(A007_03)) %>% pull(no_rows,1)
ToR_Frequency <- c(130, 300, 209)
help_df <- data.frame(Type_of_Research, ToR_Frequency )

ToR_Plot <- ggplot(data=help_df, aes(x=Type_of_Research, y=ToR_Frequency, fill = Type_of_Research)) +
  geom_bar(stat="identity", show.legend = FALSE) +
  geom_text(aes(label = ToR_Frequency), vjust = -0.3) + 
  labs(x = "Types of Research", y = "Frequency") + 
  theme(axis.text.x = element_text(angle = 0, vjust = 0, hjust=0.5), text = element_text(size = 20))
ToR_Plot

ggsave(
  "Overview of Type of Research.png",
  plot = ToR_Plot,
  device ="png",
  scale = 1,
  width = 10,
  height = 10,
  dpi = 1000
)

###Publication date###
help_df <- my_df %>%
  group_by(A004_01) %>%
  summarise(counts = n())
help_df

Publication_year <- ggplot(data = help_df, aes(y = counts, x = A004_01, fill = A004_01)) +
  geom_bar(stat="identity") + 
  labs(x="", y="Frequency") +
  ggtitle("Year of Publication")+
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Publication_year

ggsave(
  "Overview of Publication Year.png",
  plot = Publication_year,
  device ="png",
  scale = 1,
  width = 14,
  height = 10,
  dpi = 1000
)

###Methods###
my_df$A008x01 <- tolower(my_df$A008x01)
my_df$A008x01 <- str_replace(my_df$A008x01, " \\s*\\([^\\)]+\\)", "")
  
help_df <- my_df %>%
  group_by(A008x01) %>%
  summarise(counts = n()) %>%
  filter(counts>4) %>%
  arrange(desc(counts))
help_df

Methods <- ggplot(data = help_df, aes(y = counts, x = reorder(A008x01, -counts), fill = A008x01)) +
  geom_bar(stat="identity", show.legend = FALSE) + 
  labs(x="", y="Frequency") +
  ggtitle("Methods")+
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Methods

ggsave(
  "Overview of Methods.png",
  plot = Methods,
  device ="png",
  scale = 1,
  width = 14,
  height = 10,
  dpi = 1000
)

### Type of Data###


help_df <- my_df %>%
  group_by(A202) %>%
  summarise(counts = n()) %>%
  filter(counts>3) %>%
  arrange(desc(counts))
help_df

Types_of_Data <- ggplot(data = help_df, aes(y = counts, x = reorder(A202, -counts), fill = A202)) +
  geom_bar(stat="identity", show.legend = FALSE) + 
  labs(x="", y="Frequency") +
  ggtitle("Types of Data")+
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Types_of_Data

ggsave(
  "Overview of Types of Data.png",
  plot = Types_of_Data,
  device ="png",
  scale = 1,
  width = 14,
  height = 10,
  dpi = 1000
)

### Primary vs secondary data ###

help_df <- my_df %>%
  group_by(A204) %>%
  summarise(counts = n()) %>%
  filter(counts>3) %>%
  arrange(desc(counts))
help_df

Prim_v_Sec <- ggplot(data = help_df, aes(y = counts, x = reorder(A204, -counts), fill = A204)) +
  geom_bar(stat="identity", show.legend = FALSE) + 
  labs(x="", y="Frequency") +
  ggtitle("Types of Data")+
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Prim_v_Sec

ggsave(
  "Primary vs secondary data.png",
  plot = Prim_v_Sec,
  device ="png",
  scale = 1,
  width = 14,
  height = 10,
  dpi = 1000
)

### Data set sizes ###

help_vec <- as.numeric(my_df$A206_01)
help_vec <- sort(help_vec)
help_vec <- help_vec[!is.na(help_vec)]
help_df <- tibble(val = help_vec) %>%
  filter(val<1000000) %>%
  tibble::rowid_to_column("ID")


Sample_size <- ggplot(data = help_df, aes(y = val, x = ID)) +
  geom_point() +
  labs(x="", y="Sample Size") +
  ggtitle("Sample size") +
  scale_x_continuous(breaks = round(seq(min(help_df$val), max(help_df$val), by = 50000),1)) +
  scale_y_continuous(breaks = round(seq(min(help_df$val), max(help_df$val), by = 50000),1)) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Sample_size

ggsave(
  "Sample Size.png",
  plot = Sample_size,
  device ="png",
  scale = 1,
  width = 14,
  height = 10,
  dpi = 1000
)

### Data collection###

my_df$A208_01 <- tolower(my_df$A208_01)
my_df$A208_01 <- str_replace(my_df$A208_01, " \\s*\\([^\\)]+\\)", "")

help_df <- my_df %>%
  group_by(A208_01) %>%
  summarise(counts = n()) %>%
  filter(counts>3) %>%
  arrange(desc(counts)) %>%
  drop_na()
  
help_df

Data_Coll <- ggplot(data = help_df, aes(y = counts, x = reorder(A208_01, -counts), fill = A208_01)) +
  geom_bar(stat="identity", show.legend = FALSE) + 
  labs(x="", y="Frequency") +
  ggtitle("Types of Data Collection")+
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Data_Coll

ggsave(
  "Types of Data collection.png",
  plot = Data_Coll,
  device ="png",
  scale = 1,
  width = 10,
  height = 10,
  dpi = 1000
)


###Data shared###

help_df <- my_df %>%
  group_by(A210) %>%
  summarise(counts = n()) %>%
  arrange(desc(counts)) %>%
  drop_na()

Data_shared <- ggplot(data = help_df, aes(y = counts, x = reorder(A210, -counts), fill = A210)) +
  geom_bar(stat="identity", show.legend = FALSE) + 
  labs(x="", y="Frequency") +
  ggtitle("Data sharing") +
  geom_text(aes(label = counts), vjust = -0.3) + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Data_shared

ggsave(
  "Data shared.png",
  plot = Data_shared,
  device ="png",
  scale = 1,
  width = 10,
  height = 10,
  dpi = 1000
)

###Code shared###

help_df <- my_df %>%
  group_by(A301) %>%
  summarise(counts = n()) %>%
  arrange(desc(counts)) %>%
  drop_na()

Code_shared <- ggplot(data = help_df, aes(y = counts, x = reorder(A301, -counts), fill = A301)) +
  geom_bar(stat="identity", show.legend = FALSE) + 
  labs(x="", y="Frequency") +
  ggtitle("Code sharing")+
  geom_text(aes(label = counts), vjust = -0.3) +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
Code_shared

ggsave(
  "Code shared.png",
  plot = Code_shared,
  device ="png",
  scale = 1,
  width = 10,
  height = 10,
  dpi = 1000
)



