##
# tfidf-vis.R
##


df.guardian = read.csv("~/Documents/UCSD-news/results/guardian_tfidf.csv", header = TRUE, stringsAsFactors = FALSE)
df.guardian = df.guardian[,-c(507:1010)]
df.student = read.csv("~/Documents/UCSD-news/results/student_tfidf.csv", header = TRUE, stringsAsFactors = FALSE)
df.guardian$doc.source = "UCSD Guaridan"
df.student$doc.source = "Student Newspapers"

df = rbind(df.guardian, df.student)

#df = read.csv("~/Documents/UCSD-news/results/guardian_and_student_tfidf.csv", header = TRUE, stringsAsFactors = FALSE)

df$Begin.date = as.Date(df$Begin.date, "%Y-%m-%d")
library(lubridate)
df$year = year(df$Begin.date)
df$month = month(df$Begin.date)
df$decade = sapply(df$year, FUN = function(x) (x %/% 10)*10)

library(plotly)


ggplot(df, aes(x = pc0, pc1, label = Begin.date, colour = as.factor(decade))) + 
  geom_text() + facet_wrap(~doc.source)-> p
ggplotly(p)

plotly_POST(p, filename = "PCA-UCSD-news", fileopt = "overwrite")

df.pronoun = read.csv("~/Documents/UCSD-news/results/guardian_pronoun_counts.csv", header = TRUE, stringsAsFactors = FALSE)
df.g = subset(df, doc.source == "UCSD Guaridan")
df.g.pronoun = merge(df.pronoun, df.g, by = "Object.Unique.ID")

ggplot(df.g.pronoun, aes(x = pc0, pc1, label = Begin.date.x, colour = log10((1+he_counts)/(1+she_counts)))) + 
  geom_point() + facet_wrap(~decade) -> p

plotly_POST(p, filename = "PCA-guardian-he-she-ratio", fileopt = "overwrite")

ggplot(df.g.pronoun, aes(x = pc0, pc1, colour = log10((1+he_counts)/(1+she_counts)))) + 
  geom_point(alpha = .1) + facet_wrap(~decade) -> p

df.g.pronoun$he.she.ratio = (df.g.pronoun$he_counts+1)/(df.g.pronoun$she_counts+1)

summary(df.g.pronoun$he.she.ratio)
df.g.pronoun$pronoun.quartiles = 4
df.g.pronoun$pronoun.quartiles[which(df.g.pronoun$he.she.ratio <= 2.25)] = 2.25
df.g.pronoun$pronoun.quartiles[which(df.g.pronoun$he.she.ratio >= 7.25)] = 7.25

ggplot(df.g.pronoun, aes(x = pc0, pc1, label = Begin.date.x, colour = as.factor(pronoun.quartiles))) + 
  geom_text() + facet_wrap(~decade) -> p
plotly_POST(p, filename = "PCA-guardian-he-she-ratio", fileopt = "overwrite")

