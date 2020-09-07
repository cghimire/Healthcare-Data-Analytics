<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/6wj0hh6.jpg" alt="Project logo"></a>
</p>

<h3 align="center">Healthcare Data Analytics Project</h3>

<div align="center">
 
</div>

## Table of Content
  * [Overview](#overview)
  * [Data Preparation and Exploration](#data-preparation-and-exploration)
  * [Exploratory Data Analysis](#exploratory-data-analysis)
  * [Conclusion](#conclusion)

## Overview
The purpose of this data analysis is to gain a hands-on practical experience working with healthcare data. This data is public use files derived from the Vermont Uniform Hospital Discharge Data Set for 2017.
Below are the questions I will try to answer using EDA.
* What is the highest and lowest cost DRG (Diagnostic Related Group)?
* What primary procedure is performed the most?
* What is the average hospital stay (in days) for inpatients?
* What is the most common primary diagnosis?
* What is the common principal payment source to pay the medical expenses?

## Data Preparation and Exploration

Metadata of the data

![alt text](https://github.com/cghimire/Healthcare-Data-Analytics/blob/master/metadata.png "Metadata of the data")
*The inpatient data set contain 53686 rows and 79 columns. For the simplicity, I choose only 14 columns which are more interesting for the
analysis*.

![alt text](https://github.com/cghimire/Healthcare-Data-Analytics/blob/master/Age_group.png "Age Group of Inpatient")

*The bar plot shows that age group of	14 (Age	of	75	or	older) has	majority in the inpatient	data:	there	are	more	older	people stay	in	the	
hospital	while	under	treatment*.

![alt text](https://github.com/cghimire/Healthcare-Data-Analytics/blob/master/Sex_Inpatient.png "Gender based Histogram for Inpatient")

*This	bar	plot illustrates that	there	is more	female	patient	than	male	in	the	inpatient	
data	set*.

## Exploratory Data Analysis

![alt text](https://github.com/cghimire/Healthcare-Data-Analytics/blob/master/DRG_charges.png "DRG Vs Charges")

*The	above	plot	shows	the	Diagnostic	Related	Group	(DRG)	Vs	charges	amount	(cost) of	the	patient	in	the	hospital. In order to get exact maximum	and	
minimum	DRG associated	with	Charges, I have calculated minimum and maximum*. 

![alt text](https://github.com/cghimire/Healthcare-Data-Analytics/blob/master/Payment_source.png "Primary Source of Payment")

*The	histogram	shows	that	the	principal	payment	source	‘1’ has	a	highest	frequency: That	 means (according to data dictionary) Medicare	is the	most	
common	principal payment	source	for	a	patient	who	stays	in	a	hospital	while	under	treatment*.

![alt text](https://github.com/cghimire/Healthcare-Data-Analytics/blob/master/Decision%20Tree.png "Decision tree")

*The decision tree demonstrates the length of stay for patients with probabilities and percentages. For example, if the total cost is less than 227e+3 (22,7000), the patient is more likely to stay for almost five days. Also, the patient stays for fifty-five days if the charge is more than 22,7000 and so on*.

## Conclusion
* The patients, who	stays	in	a	hospital	while	under	treatment, are	mostly	older (over	75	years	old) and are	more female	in	comparison to	male.	
* The	DRG	called	“extreme	immaturity	or	respiratory	distress	syndrome”	cost	more	and DRG	called	“Normal	newborn”	cost	less	than	other	DRG.
* The	most	common	primary	diagnosis	is	‘Single	liveborn	infant,	delivered	vaginally’.
* The highest	cost	of	diagnosis group is	pretty high (1,332,080 USD),	however	most	patients	are	covered	under	Medicare.	
* The	average	length	of	stay	in the hospital	is	about	5	days and	the	patient	need to	stay	longer up	to 441 days based	on	the	nature	of	the	diagnosis.
* The	patient, belongs	to	DRG ‘After care	with	CC/MCC’, discharged after 441	days	of	admission:	which	means a	patient requires	more	resources; therefore, hospitals	are	paid	more	to	care.	

The patient belongs to DRG ‘Vaginal delivery w/o complicating diagnosis’ discharged on admission day or the day after admission, which makes perfect sense.
