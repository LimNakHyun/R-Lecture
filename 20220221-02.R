install.packages('tidyverse')
library(tidyverse)

str(mpg)
?mpg

View(mpg)

head(mpg)

p <- ggplot(data=mpg,mapping=aes(x=displ,y=hwy))
p
p+geom_point()
p+geom_point(mapping=aes(color=class,size=class))
p+geom_point(mapping=aes(color=class,size=class,alpha=0.3))

p+geom_point(mapping=aes(color=class,shape=class))
p+geom_point(mapping=aes(color=class,shape=class,alpha=0.3))

p+geom_pointmapping=aes(color='blue')
p+geom_point(color='blue')

p+geom_point(color='blue')+facet_wrap(~ class,nrow=1)
p+geom_point(color='orange')+facet_wrap(~ class,nrow=2)

table(mpg$drv)
table(mpg$cyl)
barplot(table(mpg$cyl))

p+geom_point(color='orange')+facet_grid(drv~cyl)

p+geom_point(color='steelblue')+geom_smooth(color='tomato')

p+geom_point(mapping=aes(color=class))+geom_smooth(color='tomato')


colors()


library(ggplot2)
data(diamonds)
str(diamonds)
?diamonds


p <- ggplot(data=diamonds)
p+geom_bar(mapping=aes(x=cut),fill='steelblue')
p+stat_count(mapping=aes(x=cut),fill='tomato')

p <- ggplot(data=diamonds)

p+geom_bar(mapping=aes(x=cut),fill='steelblue')

p+stat_count(mapping=aes(x=cut),fill='orange')

p+geom_bar(mapping=aes(x=cut,fill=clarity))
p+geom_bar(mapping=aes(x=cut,fill=clarity))+coord_flip()


p+geom_bar(mapping=aes(x=cut,fill=clarity),position='fill')
p+geom_bar(mapping=aes(x=cut,fill=clarity),position='fill')+coord_flip()


p+geom_bar(mapping=aes(x=cut,fill=clarity),position='dodge')
p+geom_bar(mapping=aes(x=cut,fill=clarity),position='dodge')+coord_flip()


ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,color=class,size=class))

ggplot(data=mpg)+geom_point(mapping=aes(x=displ,y=hwy,color=class,size=class),position='jitter')

p <- ggplot(data=mpg,mapping=aes(x=class,y=hwy))
p+geom_boxplot(fill='lightyellow')
p+geom_boxplot(fill='lightyellow')+coord_flip()


p <- ggplot(diamonds,aes(x=cut,fill=cut))
p+geom_bar(show.legend=F,width=1)
p+geom_bar(show.legend=F,width=1)+coord_polar()
p+geom_bar(show.legend=F,width=1)+labs(x=NULL,y=NULL)+theme(aspect.ratio=1)+coord_polar()


world <- map_data('world')
ggplot(world,aes(long,lat,group=group))+geom_polygon(fill='lightyellow',color='tomato')

