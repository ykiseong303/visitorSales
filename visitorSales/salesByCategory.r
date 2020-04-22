# 1. 대분류 업종별 매출 시각화 

# 대분류 업종별 매출
dae_up <- read_excel("kwangju_dong.xlsx",sheet='Sheet1')


dae_up_plot <- ggplot(dae_up,(aes(x=reorder(DAE,sum_sale),y=sum_sale,fill=sum_sale))) +
  geom_bar(stat='identity',color="black")+
  geom_text(aes(label=sum_sale),vjust=-0.2)+
  scale_fill_gradient(low="#FFE679",high="#FF8D1D") + 
  ggtitle("업종별 월평균매출액(대분류)")+
  theme(plot.title = element_text(face = "bold",size=15,color="darkblue",hjust=0.5))+ 
  xlab("대분류 업종") + 
  ylab("매출액")+theme(axis.title.x = element_text(size=20), axis.title.y = element_text(size=20))
dae_up_plot

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------

# 2. 중분류 업종별 매출

# 중분류 업종별 매출
jng_up <- read_excel("kwangju_dong.xlsx",sheet='Sheet2-1')


jng_up_head <- head(jng_up,10)
jng_up_plot <- ggplot(data=jng_up_head,aes(x=reorder(JNG,sum_sale),y=sum_sale,fill=sum_sale))+
  geom_bar(stat='identity',color="black")+
  geom_text(aes(label=sum_sale),vjust=-0.2)+
  scale_fill_gradient(low="#FFE679",high="#FF8D1D") + 
  ggtitle("업종별 월평균매출액(중분류)")+
  theme(plot.title = element_text(face = "bold",size=15,color="darkblue",hjust=0.5))+ 
  xlab("중분류 업종") + 
  ylab("매출액")+theme(axis.title.x = element_text(size=20), axis.title.y = element_text(size=20))
jng_up_plot


# --------------------------------------------------------------------------

  



# 3. 소분류 업종별 매출 

# 소분류 : 일반음식 > 소분류 업종별 매출
so_up <- read_excel("kwangju_dong.xlsx",sheet='Sheet2-2')

total_sum <- sum(so_up$sum_sale)

so_up_1 <- so_up
so_up_1$so <- factor(so_up_1$so, levels=rev(as.character(so_up_1$so)))

midpoint <- cumsum(so_up_1$sum_sale) - so_up_1$sum_sale/5


so_up_pie_plot <- ggplot(so_up_1, aes(x="",sum_sale,fill=so)) + 
  geom_bar(width=1,size=1,color="white",stat="identity") + 
  coord_polar("y") +
  geom_text(aes(label=paste0(round((sum_sale/total_sum*100),1),"%\n",so)),
            position = position_stack(vjust = 0.5),size=4) +
  labs(x = NULL, y = NULL, fill = NULL) +
  ggtitle("업종별 매출 비율(소분류)")+
  guides(fill = guide_legend(reverse = TRUE)) +
  scale_fill_brewer(palette = "Set3") +
  theme_classic() +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        plot.title = element_text(face = "bold",size=15,color="darkblue",hjust=0.5))
  

so_up_pie_plot
