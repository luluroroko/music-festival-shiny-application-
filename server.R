server <- function(input, output, session) {
  
  # reactive values----
  a <- reactiveValues(
    rt = NULL, # artist number (1-15)
    weekday = NULL, # festival day (1-3)
    mn = NULL, # member number (1-7)
    enter = NULL, # experience option (1-3)
  )
  
  # ui art1----
output$uiArt1 <- renderUI(
    {
      div(
        style = 'padding:0 10% 0 10%;',
        lapply(
          0:2, 
          function(i) {
            wellPanel(
              style = 'background-color:rgba(250,250,250,0.5);',
              fluidRow(
                column(
                  width = 2,
                  style = 'padding-top:5vh;',
                  actionBttn(
                    inputId = paste0('day', i+1),
                    label = (c('Aug 1st', 'Aug 2nd','Aug 3rd', 'Aug 4th')[i+1]),
                    style = 'minimal',
                    color = 'primary',
                    size = 'md'
                  )
                ),
                lapply(
                  1:5, 
                  function(j) {
                    column(
                      width = 2,
                      fullButtonRight(
                        tags$button(
                          id = paste0('btnArt', 6*i+j),
                          class = 'btn action-button',
                          style = 'background-color:rgba(0,0,0,0);',
                          img(
                            src = paste0('artists/', arts$id[6*i+j], '.png'),
                            width = '100%'
                          )
                        )
                      ),
                      h5(
                        style = 'margin-bottom:0;',
                        arts$artist[6*i+j]
                      )
                    )
                  }
                )
              )
            )
          }
        ),
        uiOutput('festTix')
      )
    }
  )
  
  # _events day button----
  observeEvent(input$day1, {a$weekday <- 1})
  observeEvent(input$day2, {a$weekday <- 2})
  observeEvent(input$day3, {a$weekday <- 3})
  
  # _events artist button----
  observeEvent(input$btnArt1, {a$rt <- 1})
  observeEvent(input$btnArt2, {a$rt <- 2})
  observeEvent(input$btnArt3, {a$rt <- 3})
  observeEvent(input$btnArt4, {a$rt <- 4})
  observeEvent(input$btnArt5, {a$rt <- 5})
  observeEvent(input$btnArt6, {a$rt <- 6})
  observeEvent(input$btnArt7, {a$rt <- 7})
  observeEvent(input$btnArt8, {a$rt <- 8})
  observeEvent(input$btnArt9, {a$rt <- 9})
  observeEvent(input$btnArt10, {a$rt <- 10})
  observeEvent(input$btnArt11, {a$rt <- 11})
  observeEvent(input$btnArt12, {a$rt <- 12})
  observeEvent(input$btnArt13, {a$rt <- 13})
  observeEvent(input$btnArt14, {a$rt <- 14})
  observeEvent(input$btnArt15, {a$rt <- 15})
  observeEvent(input$btnArt16, {a$rt <- 16})
  observeEvent(input$btnArt17, {a$rt <- 17})
  observeEvent(input$btnArt18, {a$rt <- 18})
  observeEvent(input$btnArt19, {a$rt <- 19})
  observeEvent(input$btnArt20, {a$rt <- 20})
  observeEvent(input$btnArt21, {a$rt <- 21})
  observeEvent(input$btnArt22, {a$rt <- 22})
  observeEvent(input$btnArt23, {a$rt <- 23})
  observeEvent(input$btnArt24, {a$rt <- 24})

  # _ui fest tix----
  output$festTix <- renderUI(
    if (!is.null(a$weekday)) {
      div(
        actionBttn(
          inputId = 'tix1',
          label = paste(
            'Buy',
            c('Monday', 'Tuesday', 'Wednesday')[a$weekday],
            'Pass'
          ),
          style = 'unite',
          color = 'primary',
          size = 'md'
        ),
        actionBttn(
          inputId = 'tix3',
          label = 'Buy Full 3-Day Pass',
          style = 'unite',
          color = 'success',
          size = 'md'
        )
      )
    }
  )
  
  # _events buy tix----
  observeEvent(input$tix1, {tixConf(1)})
  observeEvent(input$tix3, {tixConf(3)})
  
  # _function ticket confirm----
  tixConf <- function(d) {
    i <- if_else(d == 1, a$weekday, 4)
    shinyalert(
      title = 'Thank you!',
      text = paste0(
        '<h3>You have purchased a pass for ',
        c('Monday night', 'Tuesday night', 'Wednesday night', 
          'all Three nights')[i],
        '</h3>'
      ),
      showConfirmButton = TRUE,
      html = TRUE,
      type = 'success',
      closeOnClickOutside = TRUE
    )
  }
  
  
  # ui art2----
  output$uiArt2 <- renderUI(
    if (!is.null(a$rt)) {
      div(
        style = 'padding:0 10% 0 10%;',
        tags$iframe(
          height = '425px',
          width = '100%',
          style = 'border:5px solid white; border-radius:10px; margin-bottom:10px;',
          src = paste0(
            'https://www.youtube.com/embed/',
            arts$vid[a$rt]
          ),
          allow = 'fullscreen; autoplay;'
        ),
        fullButtonLeft(
          actionBttn(
            inputId = 'backArt1',
            label = 'Back',
            style = 'simple',
            color = 'warning',
            size = 'md',
            icon = icon('arrow-left')
          )
        )
      )
    }
  )
  
  # ui venue----
output$uiVenue <- renderUI(
    {
      div(
        style = 'padding:0 5% 0 5%;',
        wellPanel(
          style = 'background-color:rgba(100,100,100,0.7);',
          fluidRow(
            column(
              width = 6,
              align = 'left',
              h4(
                style = 'color:lightblue; line-height:1.5;',
                'The ',
                tags$span(
                  style = 'color:red; line-height:1.5;', 
                  'Stade de France ',
                  tags$span(
                    style = 'color:lightblue; line-height:1.5;',
                    paste0(
                      'Entering the gates of Castillo San Felipe del Morro is like walking 5 centuries into the past,  ',
                      'where you can get immersed in the intriguing history of one of the most significant places in the Western Hemisphere. ',
                      'EI Morro is t he most recognized landmark in Puerto Rico, ',
                      'every level has breathtaking views of the Atlantic and colorful walled islet,  ',
                      'making it a popular spot for photographs. ',
                      'If you are in San Juan for a day, ',
                      ' this fortress is one attraction you do not want to miss. '
                    )
                  )
                )
              ),
              h4(
                style = 'color:lightblue; line-height:1.5;',
                paste0(
                  'It has also hosted Christmas concerts in collaboration with symphony orchestras.  ',
                  ' The performers at the time were Mapeyé group,  ',
                  'soprano singer Natalia Gonzalez, baritone Ricardo Rivera  ',
                  'and the National Choir and Ars Vocalis directed by Mr. William Rivera. '
                )
              ),
              h4(
                style = 'color:lightblue; line-height:1.5;',
                paste0(
                  'We invite you to join us for the single greatest music ',
                  'festival while exploring all the beauty and flavors of San Juan!'
                )
              )
            ),
            column(
              width = 6,
              leafletOutput('SanJuanMap', height = '50vh')
            )
          ),
          fullButtonLeft(
            actionBttn(
              inputId = 'backVen1',
              label = 'Back',
              style = 'simple',
              color = 'warning',
              size = 'md',
              icon = icon('arrow-left')
            )
          )
        )
      )
    }
      )

      
# san juan map----
output$SanJuanMap <- renderLeaflet(
        {
          leaflet(
            data = venue
          ) %>%
            addProviderTiles(
              provider = providers$Stamen.TonerLite
            ) %>%
            addMarkers(
              lat = 18.46767505,
              lng = -66.111235249999993,
              popup = venue$venue_name
            )
        }
      )
 
  
  # ui exper----
  output$uiExper <- renderUI(
    if (!is.null(a$enter)) {
      div(
        style = 'padding:0 10% 0 10%;',
        wellPanel(
          style = 'background-color:rgba(100,100,100,0.7);
                   padding-top:3px;',
          h2(
            style = paste0(
              'color:',
              switch(
                a$enter,
                'lightblue;',
                'lightgreen;',
                'lightpink;'
              )
            ),
            switch(
              a$enter,
              'Hotels',
              'Restaurants',
              'Entertainment'
            )
          ),
          fluidRow(
            column(
              width = 8,
              leafletOutput('expMap', height = '50vh')
            ),
            column(
              width = 4,
              uiOutput('expList')
            )
          )
        ),
        fullButtonLeft(
          actionBttn(
            inputId = 'backExp1',
            label = 'Back',
            style = 'simple',
            color = 'warning',
            size = 'md',
            icon = icon('arrow-left')
          )
        )
      )
    }  
  )
  
  # _events exper button----
  observeEvent(input$hotel, {a$enter <- 1})
  observeEvent(input$rest,  {a$enter <- 2})
  observeEvent(input$enter,  {a$enter <- 3})
  
  # _exp map----
  output$expMap <- renderLeaflet(
    {
      leaflet(
        data = switch(a$enter,hotel, rest, enter)
      ) %>%
        addProviderTiles(
          provider = providers$Stamen.TonerLite
        ) %>%
        addAwesomeMarkers(
          lat = ~as.numeric(lat),
          lng = ~as.numeric(lng),
          popup = ~switch(a$enter, hotelname, name, activityname),
          icon = awesomeIcons(
            markerColor = switch(a$enter, 'blue', 'green', 'red'),
            text = 1:3
          )
        ) %>%
        addMarkers(
          lat = 18.46767505,
          lng = -66.111235249999993,
          popup = venue$venue_name
        )
    }
  )
  
  # _exp list----
  output$expList <- renderUI(
    {
      lapply(
        1:3,
        function(i) {
          wellPanel(
            align = 'left',
            h5(
              paste0(
                i, ') ', 
                switch(a$enter,
                       hotel$hotelname[i],
                       rest$name[i],
                       enter$activityname[i])
              )
            ),
            actionBttn(
              inputId = paste0('btnExp', i),
              label = switch(a$enter,
                             'Book a Room',
                             'Reserve a Table'
              ),
              style = 'simple',
              color = switch(a$enter,
                             'primary',
                             'success'),
              size = 'sm'
            )
          )
        }
      )
    }
  )

      # ui team----
      output$uiTeam <- renderUI(
        {
          div(
            style = 'padding:0 35% 0 35%;',
            lapply(
              1:7,
              function(i) {
                wellPanel(
                  style = 'background-color:rgba(255,255,255,0.9); padding:3px;',
                  fluidRow(
                    column(
                      width = 4,
                      align = 'right',
                      img(
                        src = paste0(i, '.png'),
                        height = '60vh'
                      )
                    ),
                    column(
                      width = 8,
                      align = 'left',
                      style = 'padding-top:5px;',
                      actionBttn(
                        inputId = paste0('member', i),
                        label = paste0(mem$member_name[i]),
                        style = 'stretch',
                        color = c('primary', 'success', 'warning', 'danger', 'royal')[(i - 1) %% 5 + 1],
                        size = 'lg',
                        block = FALSE
                      )
                    )
                  )
                )
              }
            )
          )
        }
      )
      
      # _events member button----
      observeEvent(input$member1, {a$mn <- 1; memDet()})
      observeEvent(input$member2, {a$mn <- 2; memDet()})
      observeEvent(input$member3, {a$mn <- 3; memDet()})
      observeEvent(input$member4, {a$mn <- 4; memDet()})
      observeEvent(input$member5, {a$mn <- 5; memDet()})
      observeEvent(input$member6, {a$mn <- 6; memDet()})
      observeEvent(input$member7, {a$mn <- 7; memDet()})
      
      # _function member details----
      memDet <- function() {
        shinyalert(
          title = paste0('Member ', a$mn),
          text = paste0(
            '<h1>CEO</h1>',
            '<hr>',
            '<img src = "', a$mn, '.png" ',
            'width ="200px"></img>'
          ),
          showConfirmButton = TRUE,
          html = TRUE,
          closeOnClickOutside = TRUE
        )
      }
}
