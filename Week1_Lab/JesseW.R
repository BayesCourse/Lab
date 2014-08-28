#Test code from Jesse Wolfhagen
plot(y~2/(x^3))
part1 <- function(x)
{
  y <- 2/(x^3)
  y
}
part2 <- function(x)
{
  y <- 3/(x^4)
  y
}
part1(1:100)
plot(x = seq(1,5,0.01), y = part1(seq(1,5, by = 0.01)), type = "l", ylim = c(0, 3))
points(x = seq(1,5,0.01), y = part2(seq(1,5,0.01)), col = "red", type = "l")
part2(1)
#Probability of Y>X is essentially the area under the curve of Y - area under the curve of X
(1/(1.5^3)) - (1/(1.5^2))
##Looking at section 2 of all of this
squaredraw <- function(n) #number of draws
{ #Draws n number of paired (x,y) points from the joint distribution of a square
  x <- runif(n, min = -6, max = 6)
  y <- runif(n, min = -6, max = 6)
  cbind(x,y)
}
plot(squaredraw(1000))
wrongtriangle <- function(n)
{
  x <- runif(n, min = -6, max = 6)
  y <- runif(n, min = -6, max = x)
  cbind(x, y)
}
wrongtriangle2 <- function(n)
{
  y <- runif(n, min = -6, max = 6)
  x <- runif(n, min = y, max = 6)
  cbind(x,y)
}
plot(wrongtriangle(1000))
plot(wrongtriangle2(1000))
#To do the triangle "correctly", pick two numbers and then keep them if they fulfill the requirements?
triangledraw <- function(n)
{
  counter <- 0
  x <- c()
  y <- c()
  while(counter < n)
  {
    potential <- runif(2, min = -6, max = 6) #potential value
    if(potential[1] >= potential[2])
    {
      x <- c(x, potential[1])
      y <- c(y, potential[2])
      counter <- counter + 1
    }
  }
  cbind(x,y)
}
plot(triangledraw(1000))
circledraw <- function(n)
{
  counter <- 0
  x <- c()
  y <- c()
  while(counter < n)
  {
    potential <- runif(2, min = -6, max = 6)
    if(sum(potential[1]^2,potential[2]^2) <= 36)
    {
      x <- c(x, potential[1])
      y <- c(y, potential[2])
      counter <- counter + 1
    }
  }
  cbind(x,y)
}
circledata <- circledraw(1000)
plot(circledata)
hist_top <- ggplot()+geom_histogram(aes(circledata[,1]))
empty <- ggplot()+geom_point(aes(1,1), color = "white")+theme(axis.ticks=element_blank(),
panel.background = element_blank(),
axis.text.x = element_blank(),
axis.text.y = element_blank(),
axis.title.x = element_blank(),
axis.title.y = element_blank(),
axis.ticks = element_blank())
scatter <- ggplot()+geom_point(aes(circledata[,1], circledata[,2]))
hist_right <- ggplot()+geom_histogram(aes(circledata[,2]))+coord_flip()
grid.arrange(hist_top, empty, scatter, hist_right, ncol = 2, nrow = 2, widths = c(4,1), heights = c(1,4))
