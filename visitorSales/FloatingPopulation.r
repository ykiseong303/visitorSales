# 유동인구 


flow_sale_re <- read_excel("kwangju_dong.xlsx",sheet='Sheet4')

flow_sale_re <- flow_sale_re$LDONG_NM

flow_sale_plot <- ggplot(flow_sale_re,aes(x=ADONG_NM,y=gender_age,fill=FLOW_VALUE)) + 
  geom_tile()+
  xlab("")+
  ylab("성별/연령")+
  theme(axis.title.y = element_text(size=20))+
  ggtitle("유동인구(매출액 정렬)")+
  theme(plot.title = element_text(face = "bold",size=15,color="darkblue",hjust=0.5))+
  scale_x_discrete(limit=c("치평동","첨단동","용봉동","수완동","충장동","우산동","상무동","광천동","서남동","송정동")) + 
  scale_fill_gradient(low="#FFE679", high="red")
flow_sale_plot
