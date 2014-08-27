library(ggplot2)
hist_top <- ggplot()+geom_histogram(aes(rnorm(100))) 
hist_top

#this is some ancient ggplot
empty <- ggplot()+geom_point(aes(1,1), colour="white")+          
            element_bl(axis.ticks=theme_blank(),
                 panel.background=theme_blank(),
                 axis.text.x=theme_blank(),                                                                      
                 axis.text.y=theme_blank(),
                 axis.title.x=theme_blank(),
                 axis.title.y=theme_blank())  

scatter <- ggplot()+geom_point(aes(rnorm(100), rnorm(100))) 
scatter
hist_right <- ggplot()+geom_histogram(aes(rnorm(100)))+coord_flip()

grid.arrange(hist_top, empty, scatter, hist_right, ncol=2, nrow=2, widths=c(4, 1), heights=c(1, 4))
