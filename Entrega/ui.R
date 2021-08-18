parse('ui.R', encoding = 'UTF-8')
header <- dashboardHeader(title = "Projeto de Estatística")

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Parâmetros", tabName = "param", icon = icon("chart-line")),
        menuItem('Comparar dados históricos', tabName = 'his', icon = icon('clock'))
    )
)

body <- dashboardBody(
    tabItems(
        tabItem(tabName = 'param',
                fluidRow(
                    box(title = 'Selecione seus parâmetros', width=12, solidHeader = TRUE, status='warning',
                        selectInput('state', 'Estados', state_list, multiple=FALSE),
                        uiOutput("timedate"),
                        actionButton('go', 'Buscar')
                        )
                ),
                fluidRow(
                    box(title = "Informações sobre o Estado", width = 12, solidHeader = TRUE,
                        DTOutput('info')
                    )
                ),
                fluidRow(
                    box(title = "Gráfico em linha das queimadas", width = 12, solidHeader = TRUE,
                        plotOutput('sh')
                    )
                ),
                fluidRow(
                    box(title = "Histograma das queimadas", width = 12, solidHeader = TRUE,
                        plotOutput('hist')
                    )
                ),
                fluidRow(
                    box(title = "Boxplot das queimadas", width = 12, solidHeader = TRUE,
                        plotOutput('boxp')
                    )
                ),
        ),
        tabItem(tabName = 'comp',
                fluidRow(
                    box(title = 'Selecione suas opções', width=12, solidHeader = TRUE, status='warning',
                        selectInput('state_comp', 'Estado', state_list, multiple=TRUE),
                        uiOutput("timedate_comp"),
                        actionButton('go_comp', 'Buscar')
                    )
                ),
                fluidRow(
                    box(title = "Informações sobre os estados", width = 12, solidHeader = TRUE,
                        DTOutput('info_comp')
                    )
                ),
                fluidRow(
                    box(title = "Gráfico em barras das queimadas", width = 12, solidHeader = TRUE,
                        plotOutput('barr')
                    )
                ),
                fluidRow(
                    box(title = "Gráfico em linhas das queimadas", width = 12, solidHeader = TRUE,
                        plotOutput('line_comp')
                    )
                ),
        )
    )
)

ui <- dashboardPage(
    skin = 'red',
    header, sidebar, body)
