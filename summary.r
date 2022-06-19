data <- read.csv('C:\\Users\\harri\\OneDrive\\ÎÄµµ\\GitHub\\final-projects-ChloeNotFound\\bestsellers_with_categories_2022_03_27.csv'
                 , quote = "", 
                 row.names = NULL, 
                 stringsAsFactors = FALSE)
require(tidyverse)
df <- readr::read_csv("C:\\Users\\harri\\OneDrive\\ÎÄµµ\\GitHub\\final-projects-ChloeNotFound\\bestsellers_with_categories_2022_03_27.csv")
summary_info <- list()

summary_info$num_observations <- nrow(df)

summary_info$max_review <- max(df$Reviews)
summary_info$book_max_review <- df[df$Reviews == summary_info$max_review, 1]

genre_total <- table(df$Genre)
summary_info$sum_by_genre <- genre_total 

summary_info$average_rating_by_genre <- df %>%
  group_by(Genre) %>%
  summarise_at(vars(`User Rating`), list(name = mean))

summary_info$average_price_by_genre<- df %>%
  group_by(Genre) %>%
  summarise_at(vars(Price), list(name = mean))


summary_info$average_rating_by_year <- df %>%
  group_by(Year) %>%
  summarise_at(vars(`User Rating`), list(name = mean))

summary_info$average_price_by_year<- df %>%
  group_by(Year) %>%
  summarise_at(vars(Price), list(name = mean))

