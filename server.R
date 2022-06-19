

book_sale <- read_csv("bestsellers_with_categories.csv")
## Server side
server <- function(input, output) {
  output$intro <- renderText({
    "We will discuss the data from the 2009-2022 Amazon Bestselling books.
    The reason that we choose this domain is that  we are all fond of reading.Books play a quintessential role in everyone’s life by introducing them to a world of imagination, providing knowledge of the outside world, 
    improving their reading, writing, and speaking skills as well as boosting memory and intelligence. 
    We believe that a list of the bestselling books will not only bring people a guide to know more good books but also give people insight into how other people live by broadening their worldview. 
    We hope to find out what books are the most popular among people by this opportunity. 
    With the knowledge that we will process the data, we can find an easier approach to finding the books we may be interested in based on the title, the category, and the review rate. "
  }) 
  
  output$sum <- renderText({
    "We can learned a lot of information from this App about the most popular books from 2009 to 2022. 
    Firstly, we can find the most popular book on any single year. Besides that, we can find the most popular fiction or nonfiction books with this App.
    Fiction is just one part of the genre, but it is surprising that 
    data of fiction is comparable with all the other genres added up. 
    From here we can see How much fiction is loved by people.
    From the graph we provided, we can learned that the book Where the Crawdads Sing is most popular book among all. 
    We can also learned that most of the books have comments less than 50000.
    After that, with the third graph we provided, we can learned that not every books we high User rating have a lot of comments, 
    which means that some books may be hard to understand, or few people know about them though they are actually good.
    Only a few books have both extremely high comment and User ratings. I believe that most readers will enjoy these books. 
    Thus, for readers like us, if we want to find the books that are most likely be enjoyed, we could select these books.
    For last, we learned that the distiribution of user ratings for fiction, non-fiction, and for both have right skewed histogram."
  }) 
  
  ##Draw a trend chart (select a date to show 24-hour trend)
  output$plot1 <- renderPlot({
    book_sale%>%
      mutate(NameYear=paste0(Name," ",Year))%>%
      filter(Year %in% input$Year)%>%
      filter(Genre %in% input$Genre)%>%
      filter(Price <= input$Price)%>%
      arrange(desc(Reviews))%>%
      head(5)%>%
      ggplot(aes(x=NameYear, y=Reviews)) + 
      geom_bar(stat='identity',width = 0.5)
    
  })
  
  output$plot2 <- renderPlot({
    book_sale%>%
      filter(Year %in% input$Year1)%>%
      filter(Genre %in% input$Genre1)%>%
      filter(Price <= input$Price1) %>%
      ggplot(aes(x = Reviews, y =..density..)) +
      geom_histogram(alpha=0.3,aes(x = Reviews, y =..density..))+
      geom_density(alpha=0.8,aes(y=..density..))+
      theme_classic()
    
    
  })
  
  
  output$plot3 <- renderPlot({
    
    
    book_sale%>%
      filter(Year %in% input$Year2)%>%
      filter(Genre %in% input$Genre2)%>%
      filter(Price <= input$Price2) %>%
      ggplot(aes(x = `User Rating`, y =Reviews)) +
      geom_point()+
      theme_classic()
    
  })
  
  
}

