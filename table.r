library(tidyverse)
data <- read.csv('bestsellers_with_categories_2022_03_27.csv')
table <- data[ , c("Name", "Genre", "User.Rating", "Price", "Year")]
colnames(table) <- c("Name", "Genre(fiction/non-fiction)", "Book_Rating", "Book_Price", "Year_Released")
df1 <- table %>%
  group_by(`Genre(fiction/non-fiction)`)%>%
  summarise(Book_Rating, Book_Price, Year_Released)
print(df1)


  