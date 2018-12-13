stats<-read.csv(file.choose())
movies<-stats
movies
colnames(movies)<-c("film","genre","critic_rating", "audience_rating", "budget", "year")
movies
summary(movies)
movies$year<-factor(movies$year)
summary(movies)
library(ggplot2)
a<-ggplot(data=movies, aes(x=critic_rating, y=audience_rating))
a+geom_point()
a<-ggplot(data=movies, aes(x=critic_rating, y=audience_rating, colour=genre, size=genre))
a+geom_point()
a<-ggplot(data=movies, aes(x=critic_rating, y=audience_rating, colour=genre, size=budget))
a+geom_point()
a<-ggplot(data=movies, aes(x=critic_rating, y=audience_rating, colour=genre, size=budget))
a+geom_point()
a+geom_line()
#plotting with layers
a+geom_point()+geom_line()
a+geom_line()+geom_point()

#overriding with ggplot

a<-ggplot(data=movies, aes(x=critic_rating, y=audience_rating, colour=genre, size=budget))
a+geom_point(aes(colour=budget)) 
a+geom_point(aes(x=budget))+ xlab("budget in millions")

#mapping vs setting
#mapping
a<-ggplot(data=movies, aes(x=critic_rating, y=audience_rating,  size=budget))
a+geom_point(aes(colour=genre)) #mapping
#setting
a<-ggplot(data=movies, aes(x=critic_rating, y=audience_rating,  colour=budget))
a+geom_point(colour="dark green")
a+geom_point(aes(colour="green")) #crestes a legend, error created
a+geom_point(aes(size=3))
a+geom_point(size=3)
a+geo_point()


#histogram vs density charts
y<-ggplot(data=movies, aes(x=budget))
y+geom_histogram(binwidth=15)
y+geom_histogram(binwidth=5)   #less binwidth means more number of verticalbars in the digrams
y+geom_histogram(binwidth=50)  # more binwidth means less number of bars in the diagram

#adding a colour to the histogram
y+geom_histogram(binwidth=10, aes(fill="green"))
y+geom_histogram(binwidth=10, aes(fill=genre, colour="black")) #also called as a stacked histogram

#creating density chart
y+geom_density(aes(fill=genre), position="stack") #not making much snese, the stacked density chart


#starting layer tips
t<-ggplot(data=movies, aes(x=audience_rating))
t+geom_histogram(binwidth=10,fill="red", colour="blue")
# the other way to draw the same histogram
t<-ggplot(data=movies)
t+geom_histogram(binwidth=10,aes(x=critic_rating), fill="white", colour="blue")


#Statistical transformation
?geom_smooth
u<- ggplot(data=movies, aes(x=critic_rating, y=audience_rating), colour=genere, size=budget)
u+geom_point() +geom_smooth()


#BOX PLOTS
u<-ggplot(data =movies, aes(x=genre, y=audience_rating), colour=genre)
u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()  # more meaningful
u+geom_point()+geom_boxplot(size=1.2)

#tip/hack using the jitter plot
u+geom_boxplot(size=1.2)+geom_jitter() #scatters the plot along different areas of the plot
#the other way
u+geom_jitter()+ geom_boxplot(size=1.2, alpha=0.5)


#same thing with critic rating u<-ggplot(data =movies, aes(x=genre, y=audience_rating), colour=genre)

#BOX PLOTS
u<-ggplot(data =movies, aes(x=genre, y=critic_rating), colour=genre)


u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()  # more meaningful
u+geom_point()+geom_boxplot(size=1.2)

#tip/hack using the jitter plot
u+geom_boxplot(size=1.2)+geom_jitter() #scatters the plot along different areas of the plot
#the other way
u+geom_jitter()+ geom_boxplot(size=1.2, alpha=0.5)


#THE USE OF FACETS(check this phas e once again)
v<-ggplot(data=movies, aes(x=budget, y=audience_rating))
v+geom_histogram(binwidth=10, aes(fill=genre), colour="black")
v+geom_point(size=3)+geom_smooth()+facet_grid(genre~.)


#working with the coordinates layer
m<-ggplot(data=movies, aes(x=critic_rating, y=audience_rating, size=budget, colour=genre))
m+geom_point()


#visualising piecewise format
m+geom_point()+xlim(50,100)+ylim(50,100)

#exception cases
n<-ggplot(data=movies,aes(budget))
n+geom_histogram(binwidth=10, aes(fill=genre, colour="black"))
n+geom_histogram(binwidth=10, aes(fill=genre, colour="black"))+ylim(50,100) #doesnot make sense at all
#using zoom operation
n+geom_histogram(binwidth=10, aes(fill=genre, colour="black"))+coord_cartesian(ylim=c(0,50))


v<-ggplot(data=movies, aes(x=budget, y=audience_rating))
v+geom_histogram(binwidth=10, aes(fill=genre), colour="black")
v+geom_point(size=3)+geom_smooth()+facet_grid(genre~year)+coord_cartesian(ylim=c(0,100))

