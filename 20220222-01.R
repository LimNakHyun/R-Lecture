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



mpg %>%
    group_by

best_in_class <- mpg %>%







































































































































































































































