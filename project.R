# ------------------------Data Exploration

data = read.csv("C:\\Users\\yalam\\OneDrive\\Documents\\Advanced data analytics LAB\\Mall_customers.csv")
str(data)
names(data)

head(data)

summary(data$Age)

sd(data$Age)

summary(data$Annual.Income..k..)
sd(data$Annual.Income..k..)
summary(data$Age)

sd(data$Spending.Score..1.100.)

a = table(data$Gender)
barplot(a, main = "Barplot for Gender Comparison",
        legend = rownames(a), col = rainbow(2),
        xlab = "Gender", ylab = "Count")


pct = round(a/sum(a)*100)
lbs = paste(c("Female","Male")," ",pct,"%",sep = " ")
library(plotrix)
pie3D(a, labels = lbs, main = "Pie chart depicting Ratio of Females vs Males")

summary(data$Age)

hist(data$Age, xlab = "Age Class", ylab = "Frequency", col = "blue", labels = TRUE, 
     main = "Histogram to show the count of age class")

boxplot(data$Age, main = "Boxplot for Age", col = "#ff0066")


summary(data$Annual.Income..k..)
hist(data$Annual.Income..k.., main = "Histogram for annual Income",
     col = "#660033", xlab = "Annual Income Class", ylab = "Frequency",
     labels = TRUE)


plot(density(data$Annual.Income..k..), col = "blue",
     main = "Density plot for annual income", xlab = "Annual Income Class",
     ylab = "Density")
polygon(density(data$Annual.Income..k..), col = "#ccff66")


summary(data$Spending.Score..1.100.)
boxplot(data$Spending.Score..1.100., 
        main = "Boxplot for descriptive analysis for spending income",
        horizontal = TRUE, col = "#ff0654")
hist(data$Spending.Score..1.100., 
     main = "Histogram for descriptive analysis for spending income",
     xlab = "Spending Score Class ", ylab = "Frequency",
     labels = TRUE, col ="#f09865")

# taking k = 6 as it fits most appropriate

k6 <- kmeans(data[,3:5],9, nstart = 50, iter.max = 100, algorithm = "Lloyd")
k6


pcclust = prcomp(data[,3:5],scale = FALSE)
# principle component analysis

summary(pcclust)
pcclust$rotation[,1:2]

# Visualize the cluster
library(ggplot2)
ggplot(data, aes(x = Annual.Income..k.., y = Spending.Score..1.100.))+
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster)))+
  scale_color_discrete(name = " ",breaks = c("1","2","3","4","5","6"), 
                       labels= c("Cluster1","Cluster2","Cluster3",
                                 "Cluster4","Cluster5","Cluster6"))+
  ggtitle("Segements of Mall customer", 
          subtitle = "Using K-means clustering")


ggplot(data, aes(x = Spending.Score..1.100., y = Age))+
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster)))+
  scale_color_discrete(name = " ",breaks = c("1","2","3","4","5","6"), 
                       labels= c("Cluster1","Cluster2","Cluster3",
                                 "Cluster4","Cluster5","Cluster6"))+
  ggtitle("Segements of Mall customer", 
          subtitle = "Using K-means clustering")

kCols <- function(vec){
  cols = rainbow(length(unique(vec)))
  return(cols[as.numeric(as.factor(vec))])
}

digCluster <- k6$cluster; 
dignm <- as.character(digCluster)
# k-means cluster

plot(pcclust$x[,1:2], col = kCols(digCluster), pch = 19, xlab = "Kmeans",
     ylab = "Classes")
legend("bottomleft", unique(dignm), fill = unique(kCols(digCluster)))
