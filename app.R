library(shiny)
library(shinythemes)
library(jsonlite)

ui <- function(request) {
  fluidPage(
    theme = shinytheme('cosmo'),
    # paper and cosmo are nice themes
    
    
    div(img(src = 'header.png', height = 180), align = 'center'),
    
    h1('Immunise For Life',
       style = 'color:black',
       align = 'center'),
    h4(
      'A campaign designed to inform you and protect those who need it most',
      align = 'center',
      style = 'color:gray'
    ),
    
    sidebarPanel(
      helpText(
        h4(strong("Contact Us", align = 'center')),
        helpText('For survey help:'),
        actionLink("help", "help@pinkbearinc.com.au *", style = 'color:blue'),
        
        br(),
        
        helpText('For feedback:'),
        actionLink("feedback", "feedback@pinkbearinc.com.au *", style = 'color:blue'),
        
        br(),
        
        helpText('For any other reason:'),
        actionLink("otherreason", "general@pinkbearinc.com.au *", style = 'color:blue'),
        
        br(),
        br(),
        
        
        div(img(src = 'vaccinevials.jpg', height = 160)),
        br(),
        bookmarkButton('Save or Share this Page')
        
        # h4('dgdjds', style = 'color:gray')
        
        
        
        
      )
    ),
    
    
    
    
    mainPanel(
      tabsetPanel(
        tabPanel(
          'Data Collection Survey',
          
          helpText(h5(strong(
            'Please read the folllowing information carefully:'
          ))),
          (
            'The following survey contains two (2) parts. The first part consists of
            three (3) questions focusing on your opinions about vaccinations. The second part consists of nine (9)
            questions about you. You may complete the questions in any order. Once you have answered all
            the questions to the best of your ability, check through your answers and click the '), strong('submit'),('
            button. If you would like to start again, click'), strong('clear all'),('. Please note that once you have 
            submitted your answers your results will be recorded and any changes made subsequently will be
            considered a new record. If you require help to complete the survey, please refer to the contact
            information in the sidebar. All responses are anonymous.'),
          
          
          fluidRow(
            column(
              width = 6,
              
              h3(helpText('Vaccination Opinions', style = 'color:gray')),
              
              radioButtons(
                "vac",
                "1. Have you, do you intend to, or would you vaccinate your
                child(ren)?",
                choiceNames = list("None selected",
                                   "Yes",
                                   "No"),
                choiceValues = list('', "VacY", "VacN")
                
              ),
              
              
              div(
                style = 'height: 150px;',
                sliderInput(
                  'risk',
                  'How well informed do you feel you are about vaccines and
                  associated risks, with 0 being not at all and 10 being fully informed?',
                  min = 0,
                  max = 10,
                  value = 5
                )
              ),
              
              
              checkboxGroupInput(
                'why',
                '2a. What are your concerns with vaccinations? Select all that apply:',
                
                choiceNames =
                  list(
                    'I believe vaccines lead to an increased risk of autism',
                    'Children should not be poked with needles',
                    'My child(ren) is/are protected by herd immunity***',
                    "My child(ren) has/have (a) suppressed immune system(s)",
                    "I don't believe vaccines work",
                    'My child is allergic to an ingredient found in vaccines',
                    'Vaccinations contain toxic chemicals',
                    'Vaccinations can make my child/ren sick',
                    'I have no concerns',
                    'Other'
                  ),
                choiceValues =
                  list(
                    'I believe vaccines lead to an increased risk of autism',
                    'Children should not be poked with needles',
                    'My child(ren) is/are protected by herd immunity***',
                    "My child(ren) has/have (a) suppressed immune system(s) ",
                    "I don't believe vaccines work",
                    'My child is allergic to an ingredient found in vaccines',
                    'Vaccinations contain toxic chemicals',
                    'Vaccinations can make my child/ren sick',
                    'I have no concerns',
                    'Other'
                  )
              )
              
              #helpText('Please scroll up to complete questions 2b and 3 ')
              
          ),
          
          column(
            width = 6,
            
            br(),
            
            textAreaInput(
              "other",
              "2b. If you answered other to the previous question,
              please explain:",
              "",
              height = 75
            ),
            verbatimTextOutput("value"),
            
            helpText(
              em(
                '***Herd immunity occurs when a large proportion of the population is vaccinated
                against a disease. This stops the disease from spreading as no one is affected
                by it, therefore making the risk of infection much lower.'
              )
              ),
            
            
            
            radioButtons(
              "flu",
              "3. Are you planning to or have you and your children (if
              applicable), been vaccinated against the flu this year?",
              choiceNames = list(
                "None selected",
                "Yes, I get vaccinated every year",
                "Yes, I get vaccinated every few years",
                "Yes, this is the first year I have been vaccinated",
                "No, but I get vaccinated every few years",
                "No, I don't believe (my children or) I am at risk",
                "No, I don't believe in vaccinations"
              ),
              choiceValues = list("", "fluYA", "fluYF", "fluY1", "fluNF", "fluNR", "fluNV")
              )
            
            #helpText("Please scroll down to complete the 'about you' section")
            
          ) # column 1 end
          
          ),
          fluidRow(
            column(
              width = 6,
              
              
              
              helpText(h3('About You', style = 'color:gray')),
              
              
              selectInput(
                "age",
                "1. How old are you?",
                c(
                  '-------' = 'agenone',
                  'Under 18' = '17',
                  '18 - 24' = '1824',
                  '25 - 30' = '2530',
                  '31 - 40' = '3140',
                  '41 - 50' = '4150',
                  '51 - 60' = '5160',
                  '61 - 70' = '6170',
                  'Over 70' = '71',
                  'Prefer not to answer' = 'nage'
                )
                
              ),
              
              radioButtons(
                'gender',
                '2. Gender?',
                c(
                  'None selected' = '',
                  'Female' = 'f',
                  'Male' = 'm',
                  'Other' = 'o',
                  'Prefer not to answer' = 'ngender'
                )
              ),
              
              selectInput(
                'edu',
                '3. What is your highest level of education?',
                c(
                  '-------' = 'edunone',
                  'Primary school graduate' = 'primary',
                  'Grade 10 or equivalent' = 'hs10',
                  'High school graduate' = 'high',
                  'Tertiary qualification' = 'uni',
                  'Prefer not to answer' = 'nedu'
                )
              ),
              
              selectInput(
                'kids',
                '4. How many children do you have?',
                c(
                  '-------' = 'kidsnone',
                  'None (0)' = '0',
                  'One (1)' = '1',
                  'Two (2)' = '2',
                  'Three (3)' = '3',
                  'Four or more (4+)' = '4',
                  'Prefer not to answer' = 'nkids'
                )
              ),
              
              
              radioButtons(
                'eng',
                '5. Is English the main language spoken at home?',
                c(
                  'None selected' = '',
                  'Yes' = 'engY',
                  'No' = 'engN',
                  'Prefer not to answer' = 'neng'
                )
              )
              
            ),
            column(
              width = 6,
              
              br(),
              br(),
              
              radioButtons(
                'atsi',
                '6. Do you identify as Aboriginal or Torres Strait Islander?',
                c(
                  'None selected' = '',
                  'Yes' = 'atsiY',
                  'No' = 'atsiN',
                  'Prefer not to answer' = 'natsi'
                )
              ),
              
              radioButtons(
                'aus',
                '7. Were you born in Australia?',
                c(
                  'None selected' = '',
                  'Yes' = 'ausY',
                  'No' = 'ausN',
                  'Prefer not to answer' = 'naus'
                )
              ),
              radioButtons(
                'kidvac',
                '8. Were you vaccinated as a child?',
                c(
                  'None selected' = '',
                  'Yes' = 'kidvacY',
                  'No' = 'kidvacN',
                  'Unsure' = 'kidvacM',
                  'Prefer not to answer' = 'nkidvac'
                )
              ),
              
              selectInput(
                'job',
                '9. Which of the following best describes you?',
                c(
                  '-------' = 'jobnone',
                  'A Student' = 'stu',
                  'In part time employment' = 'pte',
                  'In full time employment' = 'fte',
                  'Seeking employment' = 'semploy',
                  'Not currently seeking employment' = 'nsemploy',
                  'Retired' = 'retired',
                  'Prefer not to answer' = 'njob'
                )
              ),
              
              actionButton("reset", "Clear All"),
              
              actionButton("done", "Submit"),
              br(),
              br()
              
            )
          )
              ),
        
        tabPanel(
          'General Information',
          helpText(
              'A vaccine is a liquid that is usually injected with a small needle into the arm made from 
              dead or weakened forms of a disease. The body develops an immunity against the disease by 
              learning how to fight it.'
            ),
          
          helpText('With an increased percentage of vaccinated children, herd immunity is boosted protecting
                   vulnerable members of the public like tiny babies and people fighting cancer on immune 
                   suppressants.'
          ),
          
          helpText('Vaccination rates are 92%, just shy of the governments 95% target, and we hope with increased access
                   to information we can get there together.'
          ),
          
          div(img(src = 'vaccine-infographic.gif', height = 300)),
          imageOutput("image", height = "auto"),
          
          helpText(
            'A larger version of this infographic can be found by',
            a("clicking here",
              href = "https://sciencebasedpharmacy.files.wordpress.com/2013/05/vaccine-infographic.gif")
          ),
          
          helpText(
            'If you have done this survey, you personally have helped us save the lives of millions of innocent children. 
            It is by gathering your feedback that we can better understand why there is still vaccine hesitancy and anti vac 
            groups within Australia.'
          ),
          
          helpText(
            'For more information, please visit the', 
            a("Australian Government's 'Immunise Australia' website.",
              href = "http://www.immunise.health.gov.au")
            ),
          
          br()
          ),
        
        
        tabPanel('Database Record',
                 verbatimTextOutput("showdata"))
          ),
      helpText(
        "'Pink Bear Inc' is working in conjunction with the Australian Government's
        'Immunise Australia' program.
        ",
        div(h5("© Pink Bear Inc", style = 'color:pink')),
        align = 'center'
      )
      
        )
  )
}



server <- function(input, output, session) {
  showModal(
    modalDialog(
      title = 'Please Note:',
      "This website is not real. It is being used as part of my english social issue campaign assignment.
      This webpage will not record any entered data other than displaying it in the
      'database record' tab after submission. When the webpage is refreshed or closed,
      all data entered will be lost.",
      br(),
      br(),
      helpText('Press dismiss to continue', style = 'color:black')
    )
  )
  
  
  
  
  observeEvent(input$help, {
    showModal(
      modalDialog(
        title = "help@pinkbearinc.com.au *",
        'Please copy the above link into your email program for queries regarding', strong('SURVEY HELP'),
        helpText('*This email address is not real', style = 'color:black'),
        helpText('Press dismiss to continue')
      )
    )
  })
  
  observeEvent(input$feedback, {
    showModal(
      modalDialog(
        title = "feedback@pinkbearinc.com.au *",
        'Please copy the above link into your email program to give', strong('GENERAL FEEDBACK'),
        helpText('*This email address is not real', style = 'color:black'),
        helpText('Press dismiss to continue')
      )
    )
  })
  
  
  observeEvent(input$otherreason, {
    showModal(
      modalDialog(
        title = "general@pinkbearinc.com.au *",
        'Please copy the above link into your email program',
        helpText('*This email address is not real', style = 'color:black'),
        helpText('Press dismiss to continue')
      )
    )
  })
  
  observeEvent(input$done, {
    showModal(
      modalDialog(
        title = 'Thank You for Completing the Survey',
        'Click dismiss to continue',
        br(),
        br(),
        textInput('comment', 'If you would like, please leave a comment below,'), ('or contact us using one of the email
                  addresses listed in the sidebar')
      )
    )
  })
  
  observe({
    input$reset
    updateRadioButtons(session, "vac", selected = '')
    updateSliderInput(session, "risk", value = 5)
    updateCheckboxGroupInput(session, "why", choices = , selected = 0)
    updateTextAreaInput(session, "other", value = paste())
    updateRadioButtons(session, "flu", selected = '')
    updateSelectInput(session, "age",  selected = 'agenone')
    updateRadioButtons(session, "gender", selected = '')
    updateSelectInput(session, "edu",  selected = 'edunone')
    updateSelectInput(session, "kids",  selected = 'kidsnone')
    updateRadioButtons(session, "eng", selected = '')
    updateRadioButtons(session, "atsi", selected = '')
    updateRadioButtons(session, "aus", selected = '')
    updateRadioButtons(session, "kidvac", selected = '')
    updateSelectInput(session, "job",  selected = 'jobnone')
  })
  
  getdata <- eventReactive(input$done,
                           
                           ({
                             rec <- list(
                               vac = input$vac,
                               risk = input$risk,
                               why = input$why,
                               other = input$other,
                               flu = input$flu,
                               age = input$age,
                               gender = input$gender,
                               edu = input$edu,
                               kids = input$kids,
                               eng = input$eng,
                               atsi = input$atsi,
                               aus = input$aus,
                               kidvac = input$kidvac,
                               job = input$job,
                               comment = input$comment
                             )
                             return(toJSON(rec, pretty = TRUE))
                             
                             
                           }))
  
  output$showdata <- renderText(getdata())
  
}
shinyApp(ui, server, enableBookmarking = 'url')
