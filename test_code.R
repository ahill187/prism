library(prism)

library(httr)
library(jsonlite)


#The new connect_to_model requires API Key
connect_to_model("epicPrism", api_key="123456", address = "localhost:5656")


#All the input and output are flattened. They are one-level lists.
input<-list()
input$global_parameters.time_horizon<-30

#Model can be run with a partial list of inputs. Here we only change parameter time horizon. Others will get their default value
res<-model_run(input=input)

#prism::get_plots()

#prism::model_run(list(age=2,sex='Female',vector=c(1,2,3,4)))

plts<-get_plots()

for(plt in plts)
  plot(plt)


#input<-get_default_input()

#results<-model_run(input)

#input$agent$p_female<-0.7

#results<-model_run(input)

#disconnect_from_model()

#We do the clean up at the end now.
prism::disconnect_from_model()

#Shiny stuff
library(shiny)

txt<-make_app(style=F)
eval(parse(text=txt))
shinyApp(ui = ui, server = server)
