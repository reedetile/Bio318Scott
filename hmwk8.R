salinity <- c(rep('low',5),rep('high',5))
lowsal.load <- rnorm(n = 5, mean = 600, sd = 200)
highsal.load <- rnorm(n = 5, mean = 200, sd = 50)
bd.load <- append(lowsal.load,highsal.load)
df1 <- data.frame(salinity,bd.load)

t.test(bd.load ~ salinity)
library(ggplot2)
salinityPlot <- ggplot(data = df1, mapping = aes(x = salinity, y = bd.load, fill = salinity))
salinityPlot +
  geom_bar(stat = "summary", fun.y = "mean")+
  scale_fill_manual(values = c(high ='grey30', low = 'gray70'),
                    labels = c('High', 'Low'))
