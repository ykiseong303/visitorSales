# 성연령별 일반한식 매출액 시각화
# 성/연령별 일반한식 매출
m_age_sale <- read_excel("kwangju_dong.xlsx",sheet='Sheet14')
f_age_sale <- read_excel("kwangju_dong.xlsx",sheet='Sheet15')

m_age_sale <- as.data.frame(m_age_sale)
f_age_sale <- as.data.frame(f_age_sale)
gender_age_sale <- rbind(m_age_sale,f_age_sale)


gender_age_sale$sum_sale <- round((gender_age_sale$sum_sale/100000),0)

gender_age_sale_plot <- ggplot(data = gender_age_sale, aes(AGE, sum_sale, group = SEX)) +
  geom_col(aes(fill = SEX), position = "dodge") +
  geom_text(aes(label = sum_sale), position = position_dodge(0.9), vjust=-0.3) + 
  ggtitle("성연령별 일반한식 매출액")+
  theme(plot.title = element_text(face = "bold",size=15,color="darkblue",hjust=0.5))+ 
  xlab("연령") + 
  ylab("매출액")+theme(axis.title.x = element_text(size=20), axis.title.y = element_text(size=20))+
  scale_x_discrete(limit=c("20대미만","20대","30대","40대","50대","60대이상"))

gender_age_sale_plot