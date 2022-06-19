library(shiny)
library(shinythemes)
library(tidyverse)
library(plotly)
library(shinyjs)
library(DT)
library(dplyr)
library(ggplot2)

#Read all data
book_sale <- read_csv("bestsellers_with_categories.csv")

introPanel <- tabPanel("Introduction",                     
					h2('Introduction', style = "font-family: fantasy", align = "center",
					   ), 
					fluidRow(
					  #--map1
					  column(width=12, textOutput("intro"), 
					  align = "center",
            style = "font-size : 18px"
					  )
					),
					h5('The web is made by: Chloe Gao, Jung Hwan Lee, Xuchen Chen, Shenhan Xu',
					   align = "center")
)



sumPanel <- tabPanel("Summary",                     
                       h2('Summary', style = "font-family: fantasy", align = "center"),
                       fluidRow(
                         #--map1
                         column(width=12,textOutput("sum")),
                         align = "center",
                         style = "font-size : 16px"
                       )					 
)
plot_rate <- tabPanel("Rating of the book",                     
                      fluidRow(
                        column(width=4,checkboxGroupInput("Year", label = h3("Choose Year:"),
                                                          choices  =unique(book_sale$Year),selected = unique(book_sale$Year)
                        )),
                        column(width=4,checkboxGroupInput("Genre", label = h3("Choose Genre:"), choices = c("Non Fiction","Fiction"), selected = c("Non Fiction","Fiction"))),
                        column(width=4,sliderInput("Price", h3("Price:"),
                                                   min = min(book_sale$Price), max = max(book_sale$Price), value = 20
                        ))
                        
                      ),
                      h4('The Ranking of the most popular books'), 
                      fluidRow(
                        column(width=12,plotOutput('plot1'))
                      )					 
)

dataPanel <- tabPanel("The distribution of User Rating",                     
                      fluidRow(
                        column(width=4,checkboxGroupInput("Year1", label = h3("Choose Year:"),
                                                          choices  =unique(book_sale$Year),selected = unique(book_sale$Year)
                        )),
                        column(width=4,checkboxGroupInput("Genre1", label = h3("Choose Genre:"), choices = c("Non Fiction","Fiction"), selected = c("Non Fiction","Fiction"))),
                        column(width=4,sliderInput("Price1", h3("Price:"),
                                                   min = min(book_sale$Price), max = max(book_sale$Price), value = 20
                        ))
                        
                      ),
                      h4('The Ranking of the most popular books'), 
                      fluidRow(
                        column(width=12,plotOutput('plot2'))
                      )					 
)


corPanel <- tabPanel("The relation between User Rating and reviews",                     
                      fluidRow(
                        column(width=4,checkboxGroupInput("Year2", label = h3("Choose Year:"),
                                                          choices  =unique(book_sale$Year),selected = unique(book_sale$Year)
                        )),
                        column(width=4,checkboxGroupInput("Genre2", label = h3("Choose Genre:"), choices = c("Non Fiction","Fiction"), selected = c("Non Fiction","Fiction"))),
                        column(width=4,sliderInput("Price2", h3("Price:"),
                                                   min = min(book_sale$Price), max = max(book_sale$Price), value = 20
                        ))
                        
                      ),
                      h4('The relation between User Rating and reviews'), 
                      fluidRow(
                        column(width=12,plotOutput('plot3'))
                      )					 
)

## UI side
ui <- navbarPage("Title",theme = shinythemes::shinytheme("superhero"),
                 introPanel     
				,plot_rate
				,dataPanel
				,corPanel
				,sumPanel
)

