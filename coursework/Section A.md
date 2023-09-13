---
tags: R Coursework
---
## A.1
1. download the “`finance data 2022.csv`” file.
2. The `finance data 2022.csv` contains data:
	1. cumulative commitments funds——from the **International Finance Corporation(IFC)**
	2. cumulative commitments funds ——**from Loan & Guarantee participations**
	across <font color=#c10b26>different IFC regions</font> and <font color=#c10b26>countries</font>
3. Load the "finance_data_2022.csv" file into a **R data frame** called “`data_original`”
4. How **many rows** and how **many columns** does this data frame have? <u>Use R commands to display the numbers.</u>


## A.2
1. Using the data frame “<font color=#c10b26>data original</font>”, generate <u>a new data frame</u> called “<font color=#c10b26>finance data</font>” with <font color=#c10b26>5 columns</font>:
	1. <font color=#c10b26>1st </font>column should be called `IFC` and correspond to the `IFC Region` column in the **csv file**.
	2. <font color=#c10b26>2nd</font> column should be called `IFC_CC` and correspond to the “`IFC Cumulative Commitments (US$ Thousands)`” column in the **csv file**.
	3. <font color=#c10b26>3rd</font> column should be called `Country` and correspond to the “`Country`” column in the **csv file**.
	4. <font color=#c10b26>4th</font> column should be called `Loan_Guarantee_CC` and correspond to the “`Loan & Guarantee participations Cumulative Commitments (US$ Thousands)`” column in the csv file.
	5. The <font color=#c10b26>last column</font> should be called `Date` and correspond to the “`As of Date`” column in the csv file.

## A.3

1. Create a new data frame called `data_part1` by choosing <u>a subset of the data frame</u> `finance_data`
2. that contains <font color=#c10b26>all rows</font> satisfying that `IFC_CC` is <u>no less than 300000</u> and `Loan_Guarantee_CC` is <u>no more than 500000</u>. 
3. The result should be stored in the new data frame `data_part1` and your data frame `finance_data` should not be changed in this task.
4. <font color=#c10b26>Reorder</font> the rows of the data frame `data_part1` such that the values in the column `IFC_CC` are in ==descending order==.
5. Display a subset of the `data_part1` data frame consisting of the <font color=#c10b26>first 4 rows</font> and the <font color=#c10b26>three columns</font> “`IFC`”, “`IFC_CC`”, and “`Loan_Guarantee_CC`”.

## A.4
1. <font color=#c10b26>Add</font> a new <font color=#c10b26>column</font> called `IFC_ratio` to the data frame `finance_data`. 
2. For each row of the data frame, the element of the `IFC_ratio` column is computed by $\alpha/(\alpha + \beta)$ where $\alpha$ denotes the element of the `IFC_CC` column, and $\beta$ denotes the element of the `Loan_Guarantee_CC` column.
3. Now, your data frame `finance_data` should have <font color=#c10b26>6</font> columns.
4. Display a subset of the data frame `finance_data` consisting of the first <font color=#c10b26>5 rows</font> and the <font color=#c10b26>4 columns</font> “`IFC`”, “`IFC_CC`”, and “`Loan _Guarantee_CC`” and "`IFC_ratio`".
## A.5

1. Your data frame `finance_data` has a column called `Date` which corresponds to the “`As of Date`” column in the .csv file. The elements in the `Date` column are in the format of the day.
2. **month** and **year** separated by the forward slash character “/”, for example “06/30/2017”. 
3. Divide the `Date` column into <font color=#c10b26>three columns</font> called **day**, **month**, **year**. That is, for each row of the data frame finance data, the day, month and year in the `Date` column are separated into three different columns called **day**, **month**, **year**, respectively. 
4. Make sure each of the **day, month, year** **columns** is of <font color=#c10b26>numeric type</font> (rather than characters). 
5. Now, your data frame finance data should have <font color=#c10b26>8 columns</font>.
6. Display a subset of the data frame `finance_data` consisting of the <font color=#c10b26>first 5 rows</font> and <font color=#c10b26>the 4 columns</font> “`IFC_CC`”, “`day`”, “`month`”, and “`year`”.

## A.6
Next generate a summary data frame called “`summary_data`” from the “`finance_data`”. The summary data frame “`summary_data`” should have the following properties:
1. Your summary data frame should have <font color=#c10b26>7</font> rows corresponding to the <font color=#c10b26>7 different IFC regions</font> specified in the `IFC` column of “`finance_data`”.
2. Your summary data frame should also have 7 columns:
	1. `IFC` - The IFC regions: “East Asia and the Pacific”, “Europe and Central Asia”, “Latin America and the Caribbean”, “Middle East and North Africa”, “South Asia”, “Sub- Saharan Africa”, “Worldwide”
	2. `ifc_mn` - the <font color=#c10b26>mean</font> of “IFC Cumulative Commitments (US$ Thousands)” for the corresponding <font color=#c10b26>IFC region</font>.
	3. `ifc_21q` - the <font color=#c10b26>0.21-quantile</font> of “IFC Cumulative Commitments (US$ Thousands)” for the corresponding IFC region.
	4. `ifc_var` - the variance of “IFC Cumulative Commitments (US$ Thousands)” for the corresponding IFC region.
	5. `lg_mn` - the mean of “Loan & Guarantee participations Cumulative Commitments (US$Thousands)” for the corresponding IFC region.
	6. `lg_21q` - the <font color=#c10b26>0.21-quantile</font> of “Loan & Guarantee participations Cumulative Commitments (US$ Thousands)” for the corresponding IFC region.
	7. `lg_var` - the <font color=#c10b26>variance</font> of “Loan & Guarantee participations Cumulative Commitments (US$ Thousands)” for the corresponding IFC region.
3. You should use `Tidyverse` methods to create your “`summary_data`” data frame. **The missing values (NA) should not be taken into account when computing the summary data**. Your data frame `finance_data` should not be changed in this task.
4. Display the "`summary_data`" data frame


## A.7
1. Using your data frame `finance_data`, create <font color=#c10b26>a plot</font> to display the “`IFC Cumulative Commitments`” and “`Loan & Guarantee participations Cumulative Commitments`” as functions of the <font color=#c10b26>years</font>, for two different countries <font color=#c10b26>Argentina</font> and <font color=#c10b26>Brazil</font>, respectively. 
2. Your plot should have <font color=#c10b26>two panels</font>, each of which displays results corresponding to one of the two countries. 
3. In your plot, the years are represented by their <font color=#c10b26>last two digits</font> (for example, 2022 is represented by 22). 
4. The **Cumulative Commitments** should be <font color=#c10b26>in the unit of million dollars</font> (million $). Your data frame `finance_data` should not be changed in this task.

## A.8
1. Create a ==function== called “`impute_by_quantile`” which takes as input <font color=#c10b26>a vector numerical values</font>, which may include some “`NA`”s, and replaces any <font color=#c10b26>missing values</font> (“NA”s) with the <font color=#c10b26>0.9-quantile</font> of the vector.
2. Next, apply your function “`impute_by_quantile`” to each of the columns “`IFC_CC`”, “`Loan_Guarantee_CC`”, and “`IFC_ratio`” in your data frame `finance_data`. This aims to <font color=#c10b26>replace the missing values (NA)</font> with the <font color=#c10b26>0.9 quantile</font> of the corresponding column, within the data frame `finance_data`. 
3. Next, display a data frame of <font color=#c10b26>three columns</font> (“`IFC_CC`”, “`Loan_Guarantee_CC`”, and “`IFC_ratio`”) and <font color=#c10b26>1 row</font>. The “`IFC_CC`” column should contain <font color=#c10b26>a single number</font> representing the mean of the “`IFC_CC`” column of your data frame `finance_data`. The “`Loan_Guarantee_CC`” column should contain a single number representing the mean of the “`Loan_Guarantee_CC`” column of your data frame `finance_data`. The “`IFC_ratio`” column should contain a single number representing the mean of the “`IFC_ratio`” column of your data frame `finance_data`.