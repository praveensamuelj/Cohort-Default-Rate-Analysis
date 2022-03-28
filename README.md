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
