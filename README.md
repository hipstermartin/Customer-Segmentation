# Customer Segmentation using Kmeans Clustering in R

This project uses Kmeans clustering in R to cluster customers of a shop on the basis of different features. The aim of the project is to understand the patterns followed by customers while making purchases at a mall.

## Dataset

The dataset used for this project is the Mall Customer Segmentation Data available on Kaggle. It contains the following features:

- CustomerID - unique identifier for each customer
- Gender - gender of the customer
- Age - age of the customer
- Annual Income (k$) - annual income of the customer in thousands of dollars
- Spending Score (1-100) - score assigned by the mall based on customer behavior and spending nature

## Methodology

The project uses Kmeans clustering to cluster the customers based on their annual income and spending score. The optimal number of clusters is determined using the elbow method.

## Results

The results of the analysis are presented using various visualizations such as scatterplots, boxplots, and dendrograms. These visualizations help in understanding the characteristics of each cluster and provide insights into the behavior of customers.

## Requirements

The project requires the following libraries to be installed in R:

- ggplot2
- factoextra
- cluster

## Usage

To run the project, open the customer_segmentation.R file in R and run the code. The project will generate various visualizations and output the results of the clustering.

## Conclusion

The project demonstrates how Kmeans clustering can be used to segment customers based on their behavior and spending patterns. The insights gained from this analysis can be used to develop targeted marketing strategies and improve customer satisfaction.
