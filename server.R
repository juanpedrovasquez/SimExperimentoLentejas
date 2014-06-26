library(shiny)
library(ggplot2)
library(splines)


shinyServer(function(input, output) {
  
  
  
  output$distPlot <- renderPlot({
    set.seed(19)
    poblac <- input$poblac
    factorCrecim <- input$factorCrecim
    numTiradas <- input$numTiradas    
    tiradaS <<- data.frame(matrix(NaN,numTiradas,1),matrix(NaN,numTiradas,1))
    names(tiradaS) <<- c('Tirada','Lentejas')
    for (i in 1:numTiradas){
      t <- floor(runif(poblac,1,64))
      blancos <- t[t%%2==0]
      tiradaS[i,1] <<- i
      tiradaS[i,2] <<- poblac
      poblac <- round(factorCrecim * length(blancos),0)
    }
    fit <- lm(log(tiradaS$Lentejas) ~ tiradaS$Tirada )
    M0 <- round(fit$coefficients[[2]],2)
    A0 <- round(exp(fit$coefficients[[1]]),2)
    R2 <- round(summary(fit)$r.squared,3)
    
#     g <- qplot(x=tiradaS$Tirada,y=tiradaS$Lentejas, geom=c('point','smooth'),main=paste('Lentejas =',A0,'exp(',M0,' * Tirada);  R²=',R2),ylab='Lentejas en cuadro blanco', xlab='Número de Tirada')  
    g <- qplot(x=tiradaS$Tirada,y=tiradaS$Lentejas, geom=c('point','smooth'),main=bquote(Lentejas~"="~.(A0)~e^paste(.(M0)~Tirada)~";"~~~R^2~"="~.(R2)),ylab='Lentejas en cuadro blanco', xlab='Número de Tirada')
    g
    
  })

  
output$datos <- renderTable({
  set.seed(19)
  poblac <- input$poblac
  factorCrecim <- input$factorCrecim
  numTiradas <- input$numTiradas    
  tiradaS
})


})