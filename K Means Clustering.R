#Loading the data and combining
df1 <- read.csv('/Users/satyamaddali/Desktop/R for data science/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/winequality-red.csv', sep = ';')
df2 <- read.csv('/Users/satyamaddali/Desktop/R for data science/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/winequality-white.csv', sep = ';')
df1$label <- "red"
df2$label <- "white"
head(df1)
head(df2)
wine <- rbind(df1,df2)
head(wine)
tail(wine)
str(wine)
#EDA
library(ggplot2)
print(ggplot(wine, aes(residual.sugar)) + geom_histogram(aes(fill = factor(label)), color = 'black'))
print(ggplot(wine, aes(citric.acid)) + geom_histogram(aes(fill = factor(label)), color = 'black'))
print(ggplot(wine, aes(alcohol)) + geom_histogram(aes(fill = factor(label)), color = 'black'))
print(ggplot(wine, aes(x=citric.acid,y=residual.sugar)) + geom_point(aes(color = label), alpha=0.2) + scale_color_manual(values = c('#ae4554','#faf7ea')) +theme_dark())
print(ggplot(wine, aes(x=volatile.acidity,y=residual.sugar)) + geom_point(aes(color = label), alpha=0.2) + scale_color_manual(values = c('#ae4554','#faf7ea')) +theme_dark())
clus.data <- wine[,1:12]
head(clus.data)
#building the clusters
wine.cluster <- kmeans(clus.data,2)
print(wine.cluster$centers)
#Evaluating the clusters
table(wine$label, wine.cluster$cluster)








