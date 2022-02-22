fee <- read.csv("subwayfee.csv")

library(ggplot2)

p <- ggplot(fee,aes(유임승차,무임하차)) +
    geom_point(aes(color = 호선명)) + 
    geom_smooth(se = T)

p + labs(title = "유임승차와 무임하차 대비 그래프",
         subtitle = "궁금해서 그려보았습니다.",
         caption = "지하철 요금 납부를 성실히 하세욧",
         x =  "유임 승차",
         y = "무임 하차",
         color = "역 ID")

pdf.options(family = "Korea1deb")
ggsave(file="seoul_fee3.pdf",width = 1920, height = 1080, units = "px")

View(fee)