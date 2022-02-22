'''
ggplot(data=<DATA>)+
    <GEOM_FUNCTION>(
    mapping=aes(<MAPPINGS>),
    stat=<STAT>,
    position=<POSITION>
    )+
    <COORDINATE_FUNCTION>+
    <FACET_FUNCTION>
'''

library(ggplot2) # ggplot2를 임포트

ggplot(data=mpg) # mpg 데이터에 대한것을 사용하겠다.

p <- ggplot(mpg,aes(displ,hwy))+ # x축 y축의 이름을 정해준다.
    geom_point(aes(color=class))+ # 각 클래스 별 색깔을 다르게 해 준다.
    geom_smooth(se=FALSE) 

p + labs(title='Fuel Efficiency .vs. Engine Size', # 타이틀을 추가한다.
         subtitle='서브타이틀', # 서브타이틀을 추가한다.
         caption='설명', # caption(설명)을 추가한다.
         x='엔진크기', # x축 이름을 붙인다.
         y='연비', # y축 이름을 붙인다.
         color='유형별 색상' # 레전드의 이름을 붙인다.
         )

library(tidyverse)
str(mpg)
df <- mpg[,c(2,3,9,11)]

worst_by_class <- df %>%
    group_by(class) %>%
    filter(row_number(desc(hwy))==1)

p+geom_text(aes(label=model),data=worst_by_class)

p+geom_label(aes(label=model),
            data=worst_by_class,
            nudge_y=2,alpha=0.5)

label <- tibble(
    displ=Inf,hwy=Inf,
    label='Incressing engine size is \n related to decreasing fuel economy.'
    )

p+geom_text(aes(label=label), # 텍스트 넣기
            data=label, # label에 있는 텍스트를
            vjust='top', # 상단에
            hjust='right') # 우측에

p+theme(legend.position = 'top')
p+theme(legend.position = 'bottom')
p+theme(legend.position = 'left')
p+theme(legend.position = 'right')


p+theme(legend.position = 'bottom')+
    guides(color=guide_legend(nrow=1,
                              override.aes=list(size=4)))
p+theme_classic()
p+theme_bw()
p+theme_light()
p+theme_linedraw()
p+theme_dark()
p+theme_minimal()
p+theme_gray()
p+theme_void()

ggsave(file='myplot.pdf')
ggsave(file='myplot.png',
       width=1920,height=1080,units='px')


install.packages('networkD3')
# Library
library(networkD3)
library(dplyr)

# Make a connection data frame
links <- data.frame(
    source=c("group_A","group_A", "group_B", "group_C", "group_C", "group_E"), 
    target=c("group_C","group_D", "group_E", "group_F", "group_G", "group_H"), 
    value=c(2,3, 2, 3, 1, 3)
)
View(links)
# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes <- data.frame(
    name=c(as.character(links$source), as.character(links$target)) %>% 
        unique()
)
View(nodes)
# With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

# prepare color scale: I give one specific color for each node.
my_color <- 'd3.scaleOrdinal() .domain(["group_A", "group_B","group_C", "group_D", "group_E", "group_F", "group_G", "group_H"]) .range(["blue", "blue" , "blue", "red", "red", "yellow", "purple", "purple"])'

# Make the Network. I call my colour scale with the colourScale argument
p <- sankeyNetwork(Links = links, Nodes = nodes, Source = "IDsource", Target = "IDtarget", 
                   Value = "value", NodeID = "name", colourScale=my_color)
p

# save the widget
# library(htmlwidgets)
# saveWidget(p, file=paste0( getwd(), "/HtmlWidget/sankeyColor1.html"))


install.packages('gapminder')
library(gapminder)
str(gapminder)

ggplot(data=gapminder,
       mapping=aes(x=gdpPercap, # 그래프의 x축 이름을 지정
                   y=lifeExp, # 그래프의 y축 이름을 지정
                   color=continent))+ # 그래프를 이룰 대륙의 색을 지정
    geom_point(alpha=0.5)+ # 그래프의 투명도를 지정
    scale_x_log10()+ # 그래프의 x축 스케일을 로그로 바꿈
    labs(title='Life Expectancy by GDP per Capital',
         x='GDP per Capital',
         y='Life Expectancy')+
    theme(plot.title=
              element_text(size=24,
                           face='bold',
                           color='tomato'))

ggsave(file='myplot.pdf')

# 점의 크기를 인구수(pop)에 대비시키시오.

ggplot(data=gapminder,
       mapping=aes(x=gdpPercap, # 그래프의 x축 이름을 지정
                   y=lifeExp, # 그래프의 y축 이름을 지정
                   color=continent,
                   size=pop))+ # 그래프를 이룰 대륙의 색을 지정
    geom_point(alpha=0.5)+ # 그래프의 투명도를 지정
    scale_x_log10()+ # 그래프의 x축 스케일을 로그로 바꿈
    labs(title='Life Expectancy by GDP per Capital',
         x='GDP per Capital',
         y='Life Expectancy')+
    theme(plot.title=
              element_text(size=24,
                           face='bold',
                           color='tomato'))

'''
연습문제
- 공공데이터, 웹크롤링, 데이터분석 수업 중에서 사용한 데이터셋으로
  - 데이터셋은 엑셀 파일에 저장되어 있을 것
- ggplot2를 사용하여
- 심미적이고 유의미한 통찰이 있는 플롯을 그리시오.
  - 제목, 범례, 포인트, 텍스트, 테마 등 다양한 기능을 최대한 활용
- R Graph Gallery를 참고할 것을 적극 권장함.
- 17:00까지 그린 그림을 pdf 파일로 메일로 제출
  - Joonion@gmail.com
'''

