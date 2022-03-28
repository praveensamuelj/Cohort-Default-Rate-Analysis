# Cohort Default Rate Analysis of universities in the US

## HOW EDUCATION INSTITUTION FACTORS AND DEMOGRAPHICS EFFECT THE COHORT DEFAULT RATE?

When it comes to debts, Americans nearly owe about $1.73 trillion on their student loans, which is much higher than credit card debts. Student loan debts is the second-highest consumer debt category, of which make up of about 65% of today’s college graduates. The impact of having such high rates of student loans equates to disturbingly high default numbers, which means that the education that students received did not give them the benefit of repaying their student loans in a timely fashion. In this research paper, our aim is to analyze the relevant Educational Institution factors and Demographic factors that impact the Cohort Default Rate (CDR) and formulate possible recommendations for target stakeholders to have viable solutions to minimize the problem. The CDR data used in this research project is sourced from the Integrated Postsecondary Education Data System (IPEDS) and the National Student Loan Data System (NSLDS) databases.

In this project, we are analyzing 22 variables that capture Education Institution factors and Demographics that we think will affect the CDR. Our data includes 7 years of data from 6694 universities from all US states, and universities from 6 major accreditation agencies. Each year of the data has around 2% of institutions of a CDR greater than 30%. Our data consists of 2089 public, 2005 private non-profit, and 2900 private for-profit universities.

## Problem Definition & Significance
The target audience that would generally find our research interesting and helpful would be the financial leaders of universities and colleges (Commisso, 2017). Financial leaders are generally taxed with challenges in complying with standards from the US Department of Education Cohort Default Rate requirements. With the problem that our stakeholders (financial leaders) face, this proves to show a good opportunity and room for improvement. Analyzing the cohort default rate (CDR), along with the lack of effective student loan default management plans at institutions, stems from more than 194,000 people from US proprietary institutions defaulting on their federally granted student loans per year (Commisso, 2017). According to the US Department of Education, in 2011, more than 1 in 10 federal student loan borrowers entered default within 3 years of repayment, and these numbers represent the highest peak on record since the mid-1990s. Interestingly, 95% of the borrowers with outstanding debt on their education still owe money to repay their student loans; and out of these numbers, only 52% of the students who have taken a student loan did not feel it was worth paying back. And out of this cohort, only 6.7% of eligible student borrower apply for loan forgiveness. The new “3-year” CDR (or cohort default rate) in our dataset is a more accurate representation of the defaults, thereby increasing universities and colleges’ accountability for their students’ financial well-being. The new ‘three-year CDR' in our dataset is a more accurate and meaningful measure of defaults, increasing colleges' accountability for their students' financial well-being. This will also have effect on schools as the default rates increases above certain levels it has a risk of losing access to federal student aid. The importance of analyzing and devising a recommended solution for decreasing CDR for US universities can help lower student debt and increase student and college accountability to pay back student loan debt. To discover possible solutions, we need to analyze the causes and interventions for helping financial leaders to tackle the problem and implement a proper financial management system and programs in place for students to easily understand and reduce their student loan debt within a certain period after their graduation.

## Data Source and Preparation
Data collected has 20 files of year wise data. Each datafile has information of Institutions on the columns and Institution names on the rows. We have 6694 Institutions in the rows and 2392 different attributes among the columns. Here are some more details of the original dataset:
- 2089 Public, 2005 Private Non-Profit and 2600 Private For-Profit Educational Institutions.
- 65 Educational Institutions has CDR greater than 30%
- Educational Institutions from 41 accreditation agencies and 10 Regions.

Dataset contains 2392 features, but in those we have nearly 2000 features either all Null’s or “Privacy Suppressed”. Nearly 250 features we have more than 75% Null values. We filtered put those variables and end up with nearly 142 meaningful variables. Among those we have 41 columns which consists of percentage of degree’s awarded in 41 different streams. We did feature engineering on those variables and derived top 3 degree’s awarded by an Institution based on percentages. We have few exclusive variables like NUM_PRIV and NUM_PUB which represents the number of students in an Institute, we combined such variables and made it one. Few columns are filled with codes, we replaced those with actual strings e.g., Regions are coded with numerical values, we changed to actual Region names. In the final dataset we ended up with 35 columns. Dataset has 6694 institutions in the rows, from 41 accreditation agencies and 10 regions. We have considered institutions from major accreditation agencies and offering prominent major’s/degrees and removed the Institutions which offer vocational degrees by accreditation filters and Institution wise keyword filters. We have factorized, releveled and recoded categorical variables before modelling.

## Exploratory Data Analysis & Visualizations

### Distribution of Target variable - CDR:
Our assumption here is that all the colleges would try to minimize their CDR and most of the colleges should lie in a certain range and data should be normally distributed in the ideal world.
![image](https://user-images.githubusercontent.com/97752847/160484071-dd7957c4-6828-43bd-ae83-904ded3642ff.png)
As you could see here there is range between 0.02 to 0.1 where most of the colleges fall and they are trying to keep their CDR as low as possible which is what we were expecting. But you would notice that data doesn’t seems to be normally distributed and is right skewed. Also, we can see that CDR value ranges from 0.0 to ~0.7

### Distribution of log of CDR:
Taking log of CDR may end up making the data normally distributed.
![image](https://user-images.githubusercontent.com/97752847/160484218-3a1f59bb-0376-496b-acf5-1b1d355c224d.png)
This graph shows the distribution of log CDR across the data. As you can see after taking log graph seems to follow a normal distribution. So, when applying model techniques we would be using log(CDR) instead of CDR.

### Checking correlation among the continuous variables:
This matrix would help us understand the predictors which have high correlation among themselves as well as with the target variable. Predictors that have higher correlation could not be used together and would penalize the model. Any correlation between -0.7 to 0.7 should not have higher impact and could be used together.
![image](https://user-images.githubusercontent.com/97752847/160484349-1bd3574d-5fb0-4122-956f-bee4fa051aef.png)
In the above graph you can see that UGDS is having higher correlation with UGDS_WHITE, UGDS_BLACK, UGDS_HISP, UGDS_ASIAN which is expected are they come from the same category of UGDS. Also, NUM_PELL, NUM_FLOAN, NUM_MEN, NUM_WOMEN have higher correlation among themselves as well as with all the categories of UGDS.

### Top Course and their average CDR:
There might be some of the courses which may have higher and lower CDR rates, and this could be a good predictor in understanding the effect of higher or lower CDR rates in certain courses.
![image](https://user-images.githubusercontent.com/97752847/160484476-b57d840f-2a80-4daa-8bd9-6430894abaca.png)
Above graph shows bigger bubbles for the courses that have higher CDR and vice versa. Among all the different course these are some of the most popular courses in all the colleges. Here you could see that Health Profession has the highest CDR rate among all other and Legal Profession is has the lowest.

### Accreditations vs CDR:
Out of many different accreditations we have filters couple of them which are not relevant to our analysis such as Biblical associations, Theological associations, etc. It would be good to understand if CDR varies much based on these top associations that we have considered in our dataset.
![image](https://user-images.githubusercontent.com/97752847/160484617-5a701e46-e21a-449e-8f3a-e28dd5c3bc46.png)
Based on above graph we can conclude that all the associations have very comparable CDR ranges which varies from 0.0 to 0.3. Also, we could notice that New England commission and Western Association of Schools and Colleges Senior Colleges and University Commission gas very tight range between 0.0 to 0.15 which is very good in comparison to other associations. 

### Year over Year CD Distribution:
CDR should technically decrease over the years due to new policies and restrictions colleges implements from time to time, they also keep on finding the way by which values could be reduced. Our assumption is average value should decreases as we progress.
![image](https://user-images.githubusercontent.com/97752847/160485033-316715af-7e85-4fdf-9d5f-aae5ba538cf8.png)
Looking at above graph we could see that CDR value ranges does change over the year, but the effect seems to be very insignificant. In year 2010 CDR values ranges from 0.0 to 0.3 which in year 2016 it ranges from 0.0 to 0.24 with an average value of 0.07 which is lower to that in year 2010

## Predictor Table

| Predictor                        | Datatype    | Effect    | Rationale                                                                                                                                                                                              |
|----------------------------------|-------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| NUMBRANCH                        | Categorical | +/-       | We would like to analyze how the number of branches/campuses for an institute impact the CDR for an institute.                                                                                         |
| PREDDEG                          | Categorical | ?         | This variable shows the predominant kind of degree awarded  by the institute.                                                                                                                          |
| CONTROL                          | Categorical | ?         | We would like to analyze how CDR varies with in Private                                                                                                                                                |
| and  Public category Institutes. |             |           |                                                                                                                                                                                                        |
| REGION                           | Categorical | ?         | This variable includes the demographic factor of an Institute. We would like to analyze how CDR varies among the Regions.                                                                              |
| UGDS_ASIAN                       |             |           |                                                                                                                                                                                                        |
| UGDS_BLACK                       |             |           |                                                                                                                                                                                                        |
| UGDS_HISP                        |             |           |                                                                                                                                                                                                        |
| UGDS_WHITE                       | Numerical   | +/-       | Number of undergrad students with respect to Ethnicity.    Ethnicity shouldn’t affect the CDR rate. But as we know about America's history of systemic racism and red lining we can observe some bias. |
| TUITFTE                          | Numerical   | +         | Average Net tuition paid by full-time equivalent student, after deducting grands from full tuition fee.                                                                                                |
| INEXPFTE                         | Numerical   | +         | Average amount spend by the Institute on per full-time student.                                                                                                                                        |
| CCUGPROF_C                       | Categorical | ?         | This variable shows the prominent full-time or part-time students  in the Institute. We would like to analyze how CDR varies among these two groups.                                                   |
| PBI                              | Categorical | ?         | This indicates an Institute is a Predominantly Black Institute.                                                                                                                                        |
| HIS                              | Categorical | ?         | This Indicates an Institute is a Hispanic-serving institution                                                                                                                                          |
| top_course_1                     | Categorical | +/-       | Major degree awarded by Institute with respect to the stream.                                                                                                                                          |
| NUM_PELL                         | Numerical   | -         | This Indicates the number of Pell Grant awarded students in the Institute. As the Grant number increases CDR decreases.                                                                                |
| NUM_FLOAN                        | Numerical   | +         | This Indicates the Number of students under the Federal Loan. As this increases the CDR might increase.                                                                                                |
| ENDOWBEGIN                       | Numerical   | -         | This Indicates the Endowments at the beginning of the fiscal year for an Institute. As the Endowments increases the CDR might decrease.                                                                |
| YEAR                             | Numerical   | +/-       | We want to analyze the trend of CDR over the years.                                                                                                                                                    |
| ACCREDCODE                       | Categorical | +/-       | This indicates the Accreditation agency for an Institute. We would like to analyze how CDR varies with respect to Accreditation agencies.                                                              |
| UGDS                             | Numerical   | 0         | Colleges with higher number of students may decrease the CDR as the denominator in CDR increases , this vale is highly correlated with ethnic student counts above.                                    |
| NUM_MEN NUM_WOMEN                | Numerical   | +/-       | Number of undergrad students with respect to gender. It shouldn’t affect the CDR rate. But we want to check if there is any bias.                                                                      |
| CDR                              | Numerical   | Predictor | This is the predictor variable we are trying to inspect.                                                                                                                                               |
| NUM_DEFAULT                      | Numerical   | Predictor | This is the predictor variable, Number of students who defaulted within that institute in that particular year.                                                                                        |

## Models
With a handful of models, we looked at the CDR ratio, the primary model is using the Log of CDR as the predictor variable and the key effects described in the variable tables as predictors. We then looked at the data on a multi-level basis, with Institutions as level 1 and Accreditation Agencies as level 2. As a result, we have multi-level data with a few interaction variables. The interactions include the impact of public/private universities offering just 2/4 year courses on CDR rates, as well as theimpact of a low/high number of branches within public/private schools on CDR ratios.

### CDR Model – Multilevel model with Levels as Accreditation Agencies.
cdr_model1 = lmer(log(CDR3) ~ NUMBRANCH_c + PREDDEG_c + CONTROL + REGION + UGDS_ASIAN + UGDS_BLACK + UGDS_HISP + UGDS_WHITE + log(TUITFTE) + log(INEXPFTE) + CCUGPROF_c + PBI + HIS + top_course_1 + NUM_PELL + NUM_FLOAN + log(ENDOWBEGIN) + YEAR + CCUGPROF_c*CONTROL + NUMBRANCH_c*CONTROL + (1|ACCREDCODE), REML=FALSE)

###CDR Model – Multilevel model with Levels as Accreditation Agencies and Year.
cdr_model2 = lmer(log(CDR3) ~ NUMBRANCH_c + PREDDEG_c + CONTROL + REGION + UGDS_ASIAN + UGDS_BLACK + UGDS_HISP + UGDS_WHITE + log(TUITFTE) + log(INEXPFTE) + CCUGPROF_c + PBI + HIS + top_course_1 + NUM_PELL + NUM_FLOAN + log(ENDOWBEGIN) + CCUGPROF_c*CONTROL + NUMBRANCH_c*CONTROL + (1|ACCREDCODE) + (1|YEAR), REML=FALSE)

## Marginal Effects:
- Predominantly Graduate Degree offering Institutions have 100% less CDR when compared to Predominantly Under-Graduate Degree offering Institutions.
- Private for-profit and Private non-profit Institutions have 110%, 95% more CDR when compared to public Institutions.
- Institutions under Southwest (AZ, NM, OK, TX) region has higher CDR’s approximately 30% more than Institutions in Far West (AK, CA, HI, NV, OR, WA), Plains (IA, KS, MN, MO, NE, ND, SD) which have low CDR’s.
- Percentage of population of students under different Ethnicities have very very low or no impact on the CDR’s.
- Institutions which are recognized as Predominantly Black Institutions have 2% less and Hispanic Serving Institutions have 5% more CDR’s.
- If an Institute increases it’s average spending on a student by 100%, the CDR decreases by 27%.

## Actionable Recommendations
- Institutions should try increase their expenditure per full-time students, as this can marginally decrease the CDR rate.
- Institutions should try to concentrate on awarding more number of degrees(by increasing number of seats) in English Literature, Legal Profession, Engineering, sciences which can yeild lower CDR’s. Colleges can provide additional support to students in majors with higher risk of future default and nonrepayment, or steer students into majors that lead to a higher likelihood of repaying loans.
- Found that compared to Institutes that award Certificates or Associates, Institutes that award Bachelor’s and Graduate degree’s have lower CDR’s across all years.
