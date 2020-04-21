# 5. 행정동별 일반한식 매출액 현황
# shp파일 업로드
emd_kwang <- st_read("EMD_201905/TL_SCCO_EMD.shp")
cnt_kwang <- st_read("SIG_201905/TL_SCCO_SIG.shp")

# 전처리
emd_kwang %>% 
  as_tibble %>% mutate(
    EMD_CD = as.character(EMD_CD),
    EMD_ENG_NM = as.character(EMD_ENG_NM),
    EMD_KOR_NM = iconv(EMD_KOR_NM,localeToCharset(),"UTF-8")
  ) -> emd_kwang_1

cnt_kwang %>% 
  as_tibble %>% mutate(
    SIG_CD = as.character(SIG_CD),
    SIG_ENG_NM = as.character(SIG_ENG_NM),
    SIG_KOR_NM = iconv(SIG_KOR_NM,localeToCharset(),"UTF-8")
  ) -> cnt_kwang_1
# 광주 추출
emd_kwang_2 <- emd_kwang_1 %>% filter(substr(EMD_CD,1,2)=="29")
cnt_kwang_2 <- cnt_kwang_1 %>% filter(substr(SIG_CD,1,2)=="29")

want_sale <- ggplot(emd_kwang_2) + 
              geom_sf(data=want, aes(geometry=geometry,fill=sale),color="#838786",lwd=0.5,alpha=0.7) + 
              geom_sf(data=cnt_kwang_2, aes(geometry=geometry),color="black",lwd=1, alpha=0.1)+
              scale_fill_gradient(low="#FFE679", high="red")+
              ggtitle("광주광역시 한식업체 매출액")+
              theme(plot.title = element_text(face = "bold",size=15,color="darkblue",hjust=0.5)) + 
  annotate("text",x=955500,y=1694500,label="치평동",size=11) + annotate("segment",x=940000,xend=953500,y=1682900,yend = 1693500,size=1.5,color="darkgreen",arrow=arrow())+
  annotate("text", x=932500 ,y=1686000,label="광산구",size=8.5,fontface=2) + 
  annotate("text", x=940000 ,y=1677000,label="남구",size=8.5,fontface=2) + 
  annotate("text", x=941000 ,y=1683000,label="서구",size=8.5,fontface=2) + 
  annotate("text", x=950000 ,y=1680000,label="동구",size=8.5,fontface=2) + 
  annotate("text", x=947000 ,y=1690000,label="북구",size=8.5,fontface=2)

want_sale 
