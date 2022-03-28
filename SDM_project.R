rm(list=ls()) 
library(rio)
library(moments)

cdr_data1415=import('final_cdr_sdm.csv')

cdr_data1415$YDegree = ifelse(cdr_data1415$CCUGPROF == '1' |
                                cdr_data1415$CCUGPROF == '2'|
                                cdr_data1415$CCUGPROF == '3'|
                                cdr_data1415$CCUGPROF == '4', "two year","NA") 

cdr_data1415$YDegree = ifelse(cdr_data1415$CCUGPROF == '5' |
                                cdr_data1415$CCUGPROF == '6'|
                                cdr_data1415$CCUGPROF == '7'|
                                cdr_data1415$CCUGPROF == '8'|
                                cdr_data1415$CCUGPROF == '9'|
                                cdr_data1415$CCUGPROF == '10'|
                                cdr_data1415$CCUGPROF == '11'|
                                cdr_data1415$CCUGPROF == '12'|
                                cdr_data1415$CCUGPROF == '13'|
                                cdr_data1415$CCUGPROF == '14'|
                                cdr_data1415$CCUGPROF == '15', "Four year","Two Year") 

cdr_data1415$PREDDEG=as.factor(cdr_data1415$PREDDEG)
cdr_data1415$CONTROL=as.factor(cdr_data1415$CONTROL)
cdr_data1415$CONTROL = relevel(cdr_data1415$CONTROL, "PUBLIC")
cdr_data1415$REGION=as.factor(cdr_data1415$REGION)
cdr_data1415$CCUGPROF=as.factor(cdr_data1415$CCUGPROF)
cdr_data1415$PBI=as.factor(cdr_data1415$PBI)
cdr_data1415$HSI=as.factor(cdr_data1415$HSI)
cdr_data1415$HCM2=as.factor(cdr_data1415$HCM2)
cdr_data1415$top_course_1=as.factor(cdr_data1415$top_course_1)
cdr_data1415$YDegree=as.factor(cdr_data1415$YDegree)
cdr_data1415$YEAR=as.factor(cdr_data1415$YEAR)
cdr_data1415$ACCREDCODE=as.factor(cdr_data1415$ACCREDCODE)

attach(cdr_data1415)
str(cdr_data1415)

model1 = lm(NUM_DEFAULT ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
              UGDS_BLACK+UGDS_HISP+UGDS_WHITE+TUITFTE+INEXPFTE+GRADS+ENDOWBEGIN+
              CCUGPROF+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL+NUM_MEN+
              NUM_WOMEN+NUM_FLOAN, data = cdr_data1415)
summary(model1)

library(car)
vif(model3)

model2 = lm(NUM_DEFAULT ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
              UGDS_BLACK+UGDS_HISP+UGDS_WHITE+TUITFTE+INEXPFTE+GRADS+
              YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL+NUM_MEN+
              NUM_WOMEN+NUM_FLOAN, data = cdr_data1415)
summary(model2)

model3 = lm(CDR3 ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
              UGDS_BLACK+UGDS_HISP+UGDS_WHITE+TUITFTE+INEXPFTE+GRADS+
              YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL+NUM_MEN+
              NUM_WOMEN+NUM_FLOAN, data = cdr_data1415)
summary(model3)

model4 = lm(CDR3*100 ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
              UGDS_BLACK+UGDS_HISP+UGDS_WHITE+TUITFTE+INEXPFTE+GRADS+
              YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL+NUM_MEN+
              NUM_WOMEN+NUM_FLOAN+ACCREDCODE, data = cdr_data1415)
summary(model4)

stargazer(model2, model4 , type="text", single.row=TRUE)

write.csv(cdr_data,"final_cdr_sdm_temp.csv", row.names = FALSE)

model5 = lm(CDR3 ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
              UGDS_BLACK+UGDS_HISP+UGDS_WHITE+log(TUITFTE)+log(INEXPFTE)+GRADS+
              YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL+NUM_MEN+
              NUM_WOMEN+NUM_FLOAN+ACCREDCODE, data = cdr_data1415)
summary(model5)





library(lme4)
attach(cdr_data1415)
model7 = lmer(CDR3*100  ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
                     UGDS_BLACK+UGDS_HISP+UGDS_WHITE+log(TUITFTE)+log(INEXPFTE)+GRADS+
                     YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL
              +NUM_FLOAN+ACCREDCODE+REGION+(1|YEAR), data=cdr_data1415, REML=FALSE)
summary(model7)

fixef(model7) 
ranef(model7) 

vif(model7)

model8 = lmer(CDR3*100 ~ NUMBRANCH+PREDDEG+CONTROL+YEAR+ADM_RATE+UGDS_ASIAN+
                UGDS_BLACK+UGDS_HISP+UGDS_WHITE+log(TUITFTE)+log(INEXPFTE)+GRADS+
                YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL+
                NUM_FLOAN+ACCREDCODE+YEAR+(1|REGION), data=cdr_data1415, REML=FALSE)
summary(model8)

fixef(model8) 
ranef(model8) 
vif(model8)

model9 = lmer(CDR3*100 ~ NUMBRANCH+PREDDEG+CONTROL+YEAR+ADM_RATE+UGDS_ASIAN+
                UGDS_BLACK+UGDS_HISP+UGDS_WHITE+log(TUITFTE)+log(INEXPFTE)+GRADS+
                YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL
              +NUM_FLOAN+REGION+YEAR+(1|ACCREDCODE), data=cdr_data1415, REML=FALSE)
summary(model9)
fixef(model9) 
ranef(model9) 

vif(model9)

par(mfrow=c(1,2))
hist(CDR3)
hist(log(CDR3))
par(mfrow=c(1,1)) 

cor(TUITFTE,AVG_TUTION)

model77 = lmer(log(CDR3*100)  ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
                UGDS_BLACK+UGDS_HISP+UGDS_WHITE+log(TUITFTE)+log(INEXPFTE)+GRADS+
                YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL
              +NUM_FLOAN+YEAR+REGION+(1|ACCREDCODE), data=cdr_data1415, REML=FALSE)

summary(model77)

model777 = lmer(log(CDR3)  ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
                 UGDS_BLACK+UGDS_HISP+UGDS_WHITE+log(TUITFTE)+log(INEXPFTE)+GRADS+
                 YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL
               +NUM_FLOAN+YEAR+REGION+(1|ACCREDCODE), data=cdr_data1415, REML=FALSE)
ranef(model777) 
summary(model777)

library(stargazer)
stargazer(model77,model777, type="text", single.row=TRUE)

model777_2 = lmer(log(CDR3)  ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
                  UGDS_BLACK+UGDS_HISP+UGDS_WHITE+log(TUITFTE)+log(INEXPFTE)+GRADS+
                  YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL
                +NUM_FLOAN+YEAR+ACCREDCODE+(1|REGION), data=cdr_data1415, REML=FALSE)
summary(model777_2)
ranef(model777_2) 


levels(REGION)

vif(model77)
plot(model77)

library(lmtest)
dwtest(model77)  

check_autocorrelation(model77)


model78 = glmer(NUM_DEFAULT ~ NUMBRANCH+PREDDEG+CONTROL+REGION+ADM_RATE+UGDS_ASIAN+
                 UGDS_BLACK+UGDS_HISP+UGDS_WHITE+log(TUITFTE)+log(INEXPFTE)+GRADS+
                 YDegree+PBI+HSI+HCM2+top_course_1+AVG_TUTION+NUM_PELL
               +NUM_FLOAN+YEAR+REGION+(1|ACCREDCODE),family=poisson, data=cdr_data1415)
summary(model78)


levels(ACCREDCODE)
ranef(model77) 
