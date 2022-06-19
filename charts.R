library(tidyverse)
data <- read.csv('bestsellers_with_categories_2022_03_27.csv')


#With this chart, we can clearly see in each year what proportion of the books are fiction and what proportion of the books are non-fiction.
#In the chart, I can tell that in most of the years the proportion of fiction and nonfiction is almost the same. 
#In 2014 there is a relatively bigger proportion of nonfiction books. 
#In 2015 there is  a relatively bigger proportion of fiction books.
ggplot(data=data,
       mapping= aes(x=Year,fill=Genre))+
  geom_bar(position = "fill")+
  labs(x="The year released",
       fill="genre")

#With this chart, we can clearly see the number of books in each score.
#In this chart, we can tell that most of the books are in the range of 4.5-4.9.
#Largest proportion of books are about 4.8 scores compared with other scores.
ggplot(data=data,
       mapping= aes(x=User.Rating))+
  geom_histogram()+
  labs( x="User rating",
        y="The number of books")

#With this chart, we can see the relationship between reviews and rating in different genres.
#It is clear that fiction generally have more reviews than nonfiction books. 
ggplot(data=data, mapping=aes(x=User.Rating, y=Reviews, color=Genre))+geom_point()+
  geom_smooth(method="lm",se=FALSE)+
  labs(title="for different genres, the relationship between reviews and ratings",
       x="user rating",
       y="number of reviews")


