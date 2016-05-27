##
# pronoun-count-figures.R
##


df.guardian = read.csv("~/Documents/UCSD-news/results/guardian_pronoun_counts.csv", header = TRUE, stringsAsFactors = FALSE)
df.student = read.csv("~/Documents/UCSD-news/results/student_pronoun_counts.csv", header = TRUE, stringsAsFactors = FALSE)
#df.uni = read.csv("~/Documents/UCSD-news/results/uni_communications_pronoun_counts.csv", header = TRUE, stringsAsFactors = FALSE)

df.guardian$doc.source = "UCSD Guaridan"
df.student$doc.source = "Student Newspapers"
#df.uni$doc.source = "University Communications"

#df = rbind(df.guardian[,-c(3:5)], df.student[,-c(3:5)], df.uni)
df = rbind(df.guardian[,-c(3:5)], df.student[,-c(3:5)])
df$Begin.date = as.Date(df$Begin.date, "%Y-%m-%d")

library(lubridate)

df$year = year(df$Begin.date)

library(plotly)

ggplot(df, aes(x = Begin.date, y = log10((1+he_counts)/(she_counts+1)), colour = doc.source)) + 
  geom_point()-> p

ggplotly(p)

library(dplyr)
df$year = as.factor(df$year)
df %>%
  group_by(year, doc.source) %>%
  summarise(mean.he.counts = mean(he_counts),
            mean.she.counts = mean(she_counts),
            median.he.counts = median(he_counts),
            median.she.counts = median(she_counts),
            median.he.she.ratio = median(he_counts)/median(she_counts)) %>%
  as.data.frame() -> res


ggplot(res, aes(x = as.numeric(year), y = (1+median.he.counts)/(1+median.she.counts), colour = doc.source)) + 
  geom_point() +xlab("") -> p
ggplotly(p)
plotly_POST(p, filename = "yearly median pronoun ratio", fileopt = "overwrite")

ggplot(df, aes(x = Begin.date, y = word_counts, colour = doc.source)) + geom_point() -> p
ggplotly(p)
