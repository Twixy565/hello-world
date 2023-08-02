Johnson_Franchesca

Cleaning df =   Looked for unique values in all columns (lat/Lon), removed any duplicates.  
Omitted all NAs, removed several columns that wouldn't help or hurt the model.  Sorted the columns to verify if the house was listed multiple times the bedrooms and bathrooms were the same unless it indicated a remodel had been done. 

7.  Housing_T_sqft <- lm(housingdata2$`Sale Price`~ housingdata2$square_feet_total_living)
    housinhousingdata2$studentized.residuals <- rstandard(housingdata2)gmodel <- lm(housingdata2$`Sale Price` ~ 
    housingdata2$square_feet_total_living + housingdata2$bath_full_count + housingdata2$bedrooms + housingdata2$year_built, data = housingdata2)

8.  Housing_T_sqft <- lm(housingdata2$`Sale Price`~ housingdata2$square_feet_total_living)
    Housing_T_sqft

    Call:
      lm(formula = housingdata2$`Sale Price` ~ housingdata2$square_feet_total_living)

    Coefficients:
      (Intercept)  housingdata2$square_feet_total_living  
        190236.6                                  185.3  
        
summary(Housing_T_sqft)
        
        Call:
          lm(formula = housingdata2$`Sale Price` ~ housingdata2$square_feet_total_living)
        
        Residuals:
          Min       1Q   Median       3Q      Max 
        -1797527  -120336   -41637    43858  3811329 
        
        Coefficients:
          Estimate Std. Error t value Pr(>|t|)    
        (Intercept)                           190236.608   8780.272   21.67   <2e-16 ***
          housingdata2$square_feet_total_living    185.290      3.224   57.48   <2e-16 ***
          ---
          Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
        
        Residual standard error: 360800 on 12804 degrees of freedom
        Multiple R-squared:  0.2051,	Adjusted R-squared:  0.205 
        F-statistic:  3304 on 1 and 12804 DF,  p-value: < 2.2e-16


summary(housingmodel)

Call:
  lm(formula = housingdata2$`Sale Price` ~ housingdata2$square_feet_total_living + 
       housingdata2$bath_full_count + housingdata2$bedrooms + housingdata2$year_built, 
     data = housingdata2)

Residuals:
  Min       1Q   Median       3Q      Max 
-1716509  -120674   -42542    45647  3905691 

Coefficients:
  Estimate   Std. Error t value Pr(>|t|)    
(Intercept)                           -4470679.262   420767.971 -10.625  < 2e-16 ***
  housingdata2$square_feet_total_living      173.859        4.443  39.129  < 2e-16 ***
  housingdata2$bath_full_count             16753.605     6113.930   2.740  0.00615 ** 
  housingdata2$bedrooms                   -13436.194     4535.156  -2.963  0.00306 ** 
  housingdata2$year_built                   2361.521      212.370  11.120  < 2e-16 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 357900 on 12801 degrees of freedom
Multiple R-squared:  0.2179,	Adjusted R-squared:  0.2177 
F-statistic: 891.7 on 4 and 12801 DF,  p-value: < 2.2e-16

8a.  Multiple R-squared:  0.2051,	Adjusted R-squared:  0.205 
8b.  The F-stat is a lrg number and a p-value  less than .001.  
     The results say the sq ft of a lot can predict/affect the sale price of the home. 
8c.  Yes, square feet of total lot, bathroom, bedrooms and year built all affected the Sale price of homes. 

9.   Below is the model summary of multiple linear Reg. model.  The standardized betas for each parameter is:
    All have a positive relationship except for the bedroom count. So, as the number of bathrooms, total sq ft and 
    year built increase the Sale price could also increase, as long as the other predictors are held constant. 
    I also found that an increase in bedrooms is associated with a decrease in sale prices.  So if the total sq ft 
    of the house increase by .425 then the sale of the house will increase by 0.425 sd. Only if the the other predictors are constant. 

    housingdata2$square_feet_total_living housingdata2$bath_full_count          housingdata2$bedrooms 
    0.42494143                            0.02693749                           -0.02911215 
    
    housingdata2$year_built 
    0.10057206 

10. Square ft total, year built and bathroom count don't cross zero thus saying that 95% of the population
    would have a true beta value.  
    Even though bathrooms has a large C.I. and the other two (sq. total and year built) have a small 
    C.I., it's still significant.  However,
    bedrooms do cross zero, this is telling me that some samples in the population will have a positive or negative relationship.  
    I can't say that 95% of the population will have a true b value.

    confint(housingmodel)
                                                2.5 %        97.5 %
    (Intercept)                           -5295447.3152 -3645911.2079
    housingdata2$square_feet_total_living      165.1495      182.5684
    housingdata2$bath_full_count              4769.3887    28737.8208
    housingdata2$bedrooms                   -2225.7774    -4546.6107
    housingdata2$year_built                   1945.2444     2777.7976  
    
    
11. I believe it's signifigant by 69.9%.  hou

    anova(Housing_T_sqft, housingmodel)
    Analysis of Variance Table

    Model 1: housingdata2$`Sale Price` ~ housingdata2$square_feet_total_living
    Model 2: housingdata2$`Sale Price` ~ housingdata2$square_feet_total_living + 
    housingdata2$bath_full_count + housingdata2$bedrooms + housingdata2$year_built
    Res.Df        RSS Df      Sum of Sq      F    Pr(>F)    
  1  12804 1.6666e+15                                       
  2  12801 1.6398e+15  3 26849432422523 69.866 < 2.2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
> 

12. > housingdata2$studentized.residuals <- rstandard(housingmodel)
  > housingdata2$studentized.residuals <- rstudent(housingmodel)
  > housingdata2$standardized.residuals <- rstandard(housingmodel)
  > housingdata2$residuals <- resid(housingmodel)
  > housingdata2$cooks.distance <- cooks.distance(housingmodel)
  > housingdata2$dfbeta <- dfbeta(housingmodel)
  > housingdata2$dffit <- dffits(housingmodel)
  > housingdata2$leverage <- hatvalues(housingmodel)
  > housingdata2$covariance.ratios <- covratio(housingmodel)
  > housingdata2
  # A tibble: 12,806 × 14
  `Sale Price` square_feet_total_living bath_full_count bedrooms year_built residuals standarized.residuals studentized.residuals cooks.distance dfbeta[,"(Intercept)"]     dffit
  <dbl>                    <dbl>           <dbl>    <dbl>      <dbl>     <dbl>                 <dbl>                 <dbl>          <dbl>                  <dbl>     <dbl>
    1       897990                     3830               2        5       2013   -17278.               -0.0483               -0.0483    0.000000223                  247.  -0.00106 
  2       569990                     2370               2        3       1988   -59279.               -0.166                -0.166     0.000000814                 -375.  -0.00202 
  3       731000                     2370               2        3       1988   101731.                0.284                 0.284     0.00000240                   643.   0.00346 
  4       519000                     2690               3        5       1985  -148700.               -0.416                -0.416     0.0000274                  -1349.  -0.0117  
  5       515000                     2670               3        5       1981  -139777.               -0.391                -0.391     0.0000258                  -1650.  -0.0114  
  6       785000                     1850               2        4       2010   207621.                0.580                 0.580     0.0000285                  -2976.   0.0119  
  7       357886                     1850               2        4       2010  -219493.               -0.613                -0.613     0.0000319                   3146.  -0.0126  
  8       510000                     1880               2        4       1987   -18280.               -0.0511               -0.0511    0.000000142                  -32.9 -0.000842
  9       550000                     2530               2        4       1986   -88927.               -0.248                -0.248     0.00000180                  -394.  -0.00300 
  10       550000                     3150               2        4       2003  -236865.               -0.662                -0.662     0.0000119                   1319.  -0.00773 
  
  
13.  housingdata2$large.residual <- housingdata2$standarized.residuals>2|housingdata2$standarized.residuals < -2
14.  sum(housingdata2$large.residual)
15.  [1] 327

16.   The cooks.distance are greater than 1, none have an influence. Leverage is low having no influence and 
      for CVR and I don't believe any value is outside of the CVR. 

    cooks.distance leverage covariance.ratios
    <dbl>    <dbl>             <dbl>
      1        0.00285 0.00153              0.998
      2        0.00332 0.000279             0.978
      3        0.00303 0.000258             0.978
      4        0.00344 0.000288             0.977
      5        0.00332 0.000279             0.978
      6        0.00246 0.000208             0.978
      7        0.00291 0.000247             0.978
      8        0.00349 0.000291             0.977
      9        0.00289 0.000246             0.978
    10        0.00246 0.000208             0.978

17.  The condition was met, the dwt was close to 2 and greater than 1 but less than 3.  

      durbinWatsonTest(housingmodel)
    lag Autocorrelation D-W Statistic p-value
      1      0.01038419      1.979231   0.246
    Alternative hypothesis: rho != 0
    
18. The condition has been met but the average is slightly greater than one, their could be a small amount of biased present. 

vif(housingmodel)
housingdata2$square_feet_total_living          housingdata2$bath_full_count                 housingdata2$bedrooms               housingdata2$year_built 
                             1.930416                              1.581702                              1.580397                              1.338882 
 1/vif(housingmodel)
housingdata2$square_feet_total_living          housingdata2$bath_full_count                 housingdata2$bedrooms               housingdata2$year_built 
                            0.5180232                             0.6322304                             0.6327522                             0.7468916 
 mean(vif(housingmodel))
[1] 1.607849

19.  Each plot isn't linear.  Even the histogram is isn't a nice bell shape, it's slightly skewed. 


plot(housingmodel)
Hit <Return> to see next plot: 
Hit <Return> to see next plot: 
Hit <Return> to see next plot: 
Hit <Return> to see next plot: 
hist(housingdata2$studentized.residuals)

20.  I think overall our model is slightly unbiased and does represent the general population. 
    I do feel there was some discretion with the data but would need more information concerning the data. 
    Such as several homes having 0 bedrooms (studio apt?) and homes having 0 bathrooms didn't see accurate.  
    However, without that being clear, I don't think it caused too much of an issue with the model. 
   