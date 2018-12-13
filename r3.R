"hello world"
x<-1L
x
typeof(x)
x<-2.1
x
typeof(x)

# packages in R
A<-c("a", "b", "d")
sqrt(A)
install.packages("ggplot2")
library(ggplot2)
?ggplo2
?diamonds
ggplot(data= diamonds, aes(x=carat,y= price, colour=clarity, facets=.~clarity))
ggplot + geom_point()
qplot(data=diamonds, carat, price, colour=clarity, facets=.~clarity)

x<-c(1,3,5,6,6,6)
y<-c(2,5,8)
x*y
y<-c(2,5,8,4)
x*y
x/y
x+y
x-y
#above operations are called vectorised 

#below operations will be matrix operations
Salary
v1<-c(234,56,43)
v2<-c(345,76,87)
b<-cbind(v1,v2)
a<-rbind(v1,v2)
rm(v1,v2)
a
b
?rbind

Salary
colnames(Salary)<-"A"
#snake pattern matrix generation
v1<-1:20
A<-matrix(v1,5,4)
A
c1<-1:5
c2<- -1:-5
c1
cbind(c1,c2)
c1<-c("a","b")
c2<-c("c","d")
C<-rbind(c1,c2)
C
C[c1,1]
Salary["JoeJohnson", "2007"]
C
C[1,2]
colnames(C)<-c("x", "y")
C[1,"x"]
d<-1:5
names(d)<-c("a","b","c","d","e")
d["d"]
d
names(d)<-NULL
d
a<-c("a","b","c")
temp.vec<-rep(a,3)
temp.vec
b<-matrix(temp.vec,3,3)
bb
b
b[1,3]
colnames(b)<-NULL
b
#replace rownames and colnames by characters
b[2,3]
