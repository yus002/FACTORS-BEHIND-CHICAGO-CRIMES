# DEP 2020 Final Project
## - Factors Behind Chicago Crime
MSCA 31012 Data Engineering Platform Final Project  
### Executive Summary
The purpose of this project is to provide valuable insights to citizens of Chicago and public service departments to relieve public safety pressure and help residents to understand trends of crimes at Chicago with tips.
### Getting Started
**Problem & Motivation**  
Problem  
Identify and analyze factors behind Chicago crimes  

Motivation  
1. Citizens of Chicago can understand which factors may influence crime rates at specific area  
2. Helpful to protect personal and property safety  
3. Public service departments can better understand hidden factors  
4. Implement better initiatives to enhance the security of Chicago
### Sources & Tools in This Project
Portal: Chicago Public Safety - Crimes  
https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-Present/ijzp-q8t2  
Chicago Public Safety - Police Stations  
https://data.cityofchicago.org/Public-Safety/Police-Stations/z8bn-74gv  
Chicago Transportatioin - System Information of CTA  
https://data.cityofchicago.org/Transportation/CTA-System-Information-List-of-L-StopsData/8pix-ypme/data  
Affordable Housing Development  
https://data.cityofchicago.org/Community-Economic-Development/Affordable-Rental-Housing-Developments/s6ha-ppgi  
Community Area Boundaries (for visualization only)  
https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-current-/cauq-8yn6  

External: Chicago Demographic  
https://www.cps.edu/globalassets/cps-pages/initiatives/cps-ara-district-2019-041720.pdf  
### Data Processing & Codes
CleanCrimes.ipynb ----------------------- Jupyter Notebook for cleaning Crimes Table  
CleanCrimes_parsedate.ipynb  ----------- Jupyter Notebook for parsing DATE column with openrefine merged data  
CleanCTA.ipynb -------------------------- Jupyter Notebook for cleaning CTA data  
CleanPoliceStation.ipynb ---------------- Jupyter Notebook for cleaning Police Station location file  
CleanRentalHousing.ipynb -------------- Jupyter Notebook for cleaning Affordable Rental Housing data  
Demographic Data Process.ipynb ------ Jupyter Notebook for cleaning and merging Demographic Data  
531.ipynb -------------------------------- Jupyter Notebook for extracting one day record from crime table  
quries.sql -------------------------------- SQL Script file for quries within GCP SQL Server
### Database Schema / Info & Cloud Deployment
In the SQL folder, two files were generated to establish snowflake schema for Dimensional Model  
FACTDDL.sql ----------------------------- DDL file ready to run to generate schema in MySQL WORKBENCH or Cloud  
ddlfinalproject.txt ------------------------ DDL file in txt format for backup  
  
163360 Crime Records Stored with Google Cloud Platform SQL Database  
  
MongoDB.pdf ----------------------------- PDF file for prototype MongoDB database with TOP20 crimes based on   
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &ensp; District, Community and Location  
### Data Visualization & Insights
Crime Tableau Visualization.twbx ------------------ Tableau file with visualization based on crime records   
Crime Tableau Visualization2.twbx  ----------------- Tableau file with visualization based on crime records   
demogroupanalysis.twbx --------------------------- Tableau file with visualization based on demographic info   
Crime_Kmeans_Analysis_NEW.ipynb --------------- Jupyter Notebook file of KMeans clustering analysis  
&emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &ensp; for combination of demographic data and crime records
