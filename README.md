### 프로젝트 명 : 광주광역시 방문객 매출특성 분석  
+ 기간 : 2020.02 ~ 2020.03
+ 설명 :  
홍보자료(시연)를 목적으로 제작된 자료의 시각화 코드입니다.  
광주광역시 방문객의 매출특성을 분석하고, 가장 높은 매출을 올린 일반한식 업종에 대해 시각화한 자료입니다.  
※ 내부 데이터를 사용한 자료이므로, 전처리 코드(SAS)와 데이터 목록은 비공개처리  

+ 사용 데이터 : 
  + ************(2018)
  + ************(2018)
  + ************(2018)  

+ 주사용기술 : 
  + SAS (데이터 전처리)
  + R (데이터 시각화)
  
  
### 개발환경
+ SAS EnterpriseGuide
+ R version 3.6.2
  
### 프로젝트 진행상황
+ 1주차 (02.03 ~ 02.07)
  + 프로젝트 주제 선정후, 분석을 위한 매출관련 DB 선정 
+ 2~3주차 (02.10 ~ 02.21)
  + 데이터 전처리 (SAS)
  + 광주광역시 방문객 데이터만 추출 및 업종별 분류
+ 4주차 (02.24 ~ 02.28) : 데이터 시각화 작업
  + 업종별 매출액 시각화 
  ```R
  dae_up_plot <- ggplot(dae_up,(aes(x=reorder(DAE,sum_sale),y=sum_sale,fill=sum_sale))) +
    geom_bar(stat='identity',color="black")+
    geom_text(aes(label=sum_sale),vjust=-0.2)+
    scale_fill_gradient(low="#FFE679",high="#FF8D1D")
  ```
  ![subdivsion](https://user-images.githubusercontent.com/41833412/79931553-38b39a00-8486-11ea-98b5-b326f84db409.PNG)
  > 일반한식의 세분류별 매출특성 시각화 자료
  + shp 파일 업로드 및 전처리
  ```R
  # shp파일 업로드
  emd_kwang <- st_read("EMD_201905/TL_SCCO_EMD.shp")
  # 지역구분 필드명 전처리작업
  emd_kwang %>% 
    as_tibble %>% mutate(
      EMD_CD = as.character(EMD_CD),
      EMD_ENG_NM = as.character(EMD_ENG_NM),
      EMD_KOR_NM = iconv(EMD_KOR_NM,localeToCharset(),"UTF-8")
    ) -> emd_kwang_1
  # shp파일에서 광주지역만 추출
  emd_kwang_2 <- emd_kwang_1 %>% filter(substr(EMD_CD,1,2)=="29")
  ```
  + 행정동별 일반한식 매출액 현황
  ```R
  want_sale <- ggplot(emd_kwang_2) + 
              geom_sf(data=want, aes(geometry=geometry,fill=sale),color="#838786",lwd=0.5,alpha=0.7) + 
              geom_sf(data=cnt_kwang_2, aes(geometry=geometry),color="black",lwd=1, alpha=0.1)+
              scale_fill_gradient(low="#FFE679", high="red")
  ```
  ![regionalSales](https://user-images.githubusercontent.com/41833412/79931513-25a0ca00-8486-11ea-850f-13b5065368c3.PNG)

  > shp파일은 지리서비스정보를 통해 다운로드 필요
+ 5주차 (03.02 ~ 03.06)
  + 발표자료 문서제작 및 피드백
