# 세분류별 매출

detail_sale <- read_excel("kwangju_dong.xlsx",sheet='Sheet5')

detail_sale$sale <- round((detail_sale$sale/100000),0)
detail_sale_plot <- ggballoonplot(detail_sale, fill='sale',size.range = c(1,17)) + 
  scale_fill_viridis_c(option = "C")+
  ggtitle("일반한식 세분류별 매출액")+
  theme(plot.title = element_text(face = "bold",size=20,color="darkblue",hjust=0.5)) 
detail_sale_plot