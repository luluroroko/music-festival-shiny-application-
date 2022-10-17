ui <- fullPage(
  
  opts = list(
    controlArrows = FALSE,
    fadingEffect = TRUE,
    fitToSection = TRUE,
    loopBottom = FALSE,
    loopHorizontal = TRUE,
    navigation = FALSE,
    scrollBar = FALSE,
    scrollOverflow = TRUE,
    scrollOverflowReset = TRUE,
    slidesNavigation = TRUE,
    verticalCentered = TRUE
  ),
  
  # menu tabs----
  menu = c(
    'The Music Festival' = 'home',
    'The Lineup' = 'artist',
    'The Castle' = 'venue',
    'The Experience' = 'exper',
    'About Us' = 'about'
  ),
  
  # home section----
  fullSectionImage(
    menu = 'home',
    center = TRUE,
    img = 'purto.gif',
    fullSlide(
      div(
        style = 'padding:0 20% 0 20%;',
        wellPanel(
          style = 'background-color:rgba(20,20,20,0.5); 
                   padding:15px; border-width:0;',
          fullButtonDown(
            img(
              src = 'flag.jpeg',
              height = '120px',
            )
          ),
          h1(
            style = 'color:white; font-size:40px;',
            'Castle Music Festival in Puerto Rico'
          ),
          hr(),
          div(
            style = 'padding:0 5% 0 5%;',
            fluidRow(
              column(
                width = 5,
                align = 'right',
                actionBttn(
                  inputId = 'sqlDts',
                  label = 'August 1st, 2023',
                  style = 'stretch',
                  color = 'primary',
                  size = 'sm'
                )
              ),
              column(
                width = 2,
                h5(style = 'color:white;','|')
              ),
              column(
                width = 5,
                align = 'left',
                actionBttn(
                  inputId = 'sqlDts',
                  label = 'Puerto Rico, U.S.',
                  style = 'stretch',
                  color = 'success',
                  size = 'sm'
                )
              )
            )
          )
        )
      ),
      div(
        style = 'padding:20px 10% 0 10%;',
        fluidRow(
          column(
            width = 4,
            wellPanel(
              style = 'background-color:rgba(0,0,255,0.5); 
                       padding:10px; border-width:0;',
              h1(style = 'color:white;', '15'),
              h5(style = 'color:white;', 'World\'s Greatest Artists!')
            )
          ),
          column(
            width = 4,
            wellPanel(
              style = 'background-color:rgba(255,255,255,0.5); 
                       padding:10px; border-width:0;',
              h1(style = 'color:white;', '3'),
              h5(style = 'color:white;', 'days of different music types!')
            )
          ),
          column(
            width = 4,
            wellPanel(
              style = 'background-color:rgba(255,0,0,0.5); 
                       padding:10px; border-width:0;',
              h1(style = 'color:white;', '1'),
              h5(style = 'color:white;', 'Unforgettable Island Adventure!')
            )
          )
        )
      )
    )
  ),
  
  # artists section----
  fullSectionImage(
    menu = 'artists',
    center = TRUE,
    img = 'artist.jpeg',
    fullSlide(
      uiOutput('uiArt1')
    ),
    fullSlide(
      uiOutput('uiArt2')
    )
  ),
  
  # venue section----
  fullSectionImage(
    menu = 'venue',
    center = TRUE,
    img = 'venue.jpeg',
    fullSlide(
      fullButtonRight(
        img(
          src = 'art.jpeg',
          width = '50%'
        )
      )
    ),
    fullSlide(
      uiOutput('uiVenue')
    )
  ),
  
  # exper section----
  fullSectionImage(
    menu = 'exper',
    center = TRUE,
    img = 'exper.jpeg',
    fullSlide(
      wellPanel(
        style = 'background-color:rgba(0,0,0,0); border:0px; 
                 padding:0 15% 0 15%;',
        h1('Explore Puerto Rico'),
        hr(),
        fluidRow(
          column(
            width = 4,
            fullButtonRight(
              actionBttn(
                inputId = 'hotel',
                label = 'Hotels',
                style = 'jelly',
                color = 'royal',
                size = 'lg',
                block = TRUE
              )
            )
          ),
          column(
            width = 4,
            fullButtonRight(
              actionBttn(
                inputId = 'rest',
                label = 'Restaurants',
                style = 'jelly',
                color = 'success',
                size = 'lg',
                block = TRUE
              )
            )
          ),
          column(
            width = 4,
            fullButtonRight(
              actionBttn(
                inputId = 'enter',
                label = 'Entertainment',
                style = 'jelly',
                color = 'primary',
                size = 'lg',
                block = TRUE
              )
            )
          )
        )
      )
    ),
    fullSlide(
      uiOutput('uiExper')
    )
  ),
  
  # about section----
  fullSectionImage(
    menu = 'about',
    center = TRUE,
    img = 'about.jpeg',
    fullSlide(
      wellPanel(
        style = 'background-color:rgba(0,0,0,0); border:0px; 
                 padding-top:40vh; padding-bottom:40vh;',
        fullButtonRight(
          h1(
            style = 'color:white;',
            'Our Team'
          )
        )
      )
    ),
    fullSlide(
      uiOutput('uiTeam')
    )
  )
  
)