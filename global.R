# for fullPage:
#install.packages("remotes")
#remotes::install_github("RinteRface/fullPage")
library(fullPage)
library(leaflet)
library(RPostgres)
library(scales)
library(shiny)
library(shinyalert)
library(shinyWidgets)
library(tidyverse)

# connect to the fest6 database----
con <- dbConnect(
  drv = dbDriver('Postgres'),
  dbname = 'fest6',
  host = 'db-postgresql-nyc1-44203-do-user-8018943-0.b.db.ondigitalocean.com',
  port = 25060,
  user = 'proj22b_6',
  password = 'AVNS_b7LHL0qkqq72vZtT_wv',
  sslmode = 'require'
)

arts <- dbGetQuery(con, 'SELECT * FROM artist;')
genre <- dbGetQuery(con, 'SELECT * FROM genre JOIN artist USING (genre);')
day <- dbGetQuery(con, 'SELECT * FROM weekday JOIN artist USING (weekday);')
venue <-dbGetQuery(con, 'SELECT * FROM venue JOIN artist USING (venue_id);')
enter <- dbGetQuery(con, 'SELECT * FROM entertainment;')
cate <- dbGetQuery(con, 'SELECT * FROM category JOIN entertainment USING (category);')
level <- dbGetQuery(con, 'SELECT * FROM level JOIN entertainment USING (level);')
hotel <- dbGetQuery(con, 'SELECT * FROM hotel JOIN level USING (level);')
rest<- dbGetQuery(con, 'SELECT * FROM restaurant;')
food<-dbGetQuery(con, 'SELECT * FROM food JOIN restaurant USING (food);')
mem <-dbGetQuery(con, 'SELECT * FROM member;')

# when exiting app, disconnect from the  database
onStop(
  function()
  {
    dbDisconnect(con)
  }
)