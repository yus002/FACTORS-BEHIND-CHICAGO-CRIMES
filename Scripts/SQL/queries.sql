# Find out how many times Theft with over $500 happened in 2020 until 2020-10-14
SELECT CASE_NUMBER, DATE, PRIMARY_TYPE, DESCRIPTION, ARREST FROM finalproject.crime WHERE PRIMARY_TYPE = 'THEFT' ORDER BY DATE;
SELECT COUNT(*) FROM finalproject.crime WHERE PRIMARY_TYPE = 'THEFT' AND DESCRIPTION = 'OVER $500' AND DATE < '2020-10-15 00:00:00';

# Find out the most battery happened in which police district order by the amount of batteries
SELECT 
    pd.DISTRICT_NAME,
    COUNT(DISTINCT (c.CRIME_ID)) AS BATTERY_Number
FROM
    finalproject.crime AS c
        JOIN
    finalproject.fact_table AS ft
        JOIN
    finalproject.police_district AS pd
WHERE
    c.CRIME_ID = ft.crime_CRIME_ID
        AND ft.police_district_DISTRICT_ID = pd.DISTRICT_ID
        AND c.PRIMARY_TYPE = 'BATTERY'
GROUP BY ft.police_district_DISTRICT_ID
ORDER BY BATTERY_Number DESC;

# Find out top 10 blocks which have the most crime records
SELECT 
    BLOCK, COUNT(DISTINCT (CRIME_ID)) AS CASES
FROM
    finalproject.crime
GROUP BY BLOCK
ORDER BY CASES DESC
LIMIT 10;

#Find out the crimes happened in each community area ordered by the amounts of crimes.
SELECT 
      cm.AREA_NUMBER,
      Count(c.CRIME_ID) AS Crimecount
FROM
       finalproject.crime as c
          JOIN 
       finalproject.community as cm
          JOIN
       finalproject.fact_table as f
WHERE
       c.CRIME_ID = f.crime_CRIME_ID
       AND f.community_COMMUNITY_AREA_NUMBER=cm.AREA_NUMBER
GROUP BY f.community_COMMUNITY_AREA_NUMBER
ORDER BY Crimecount DESC;

# Find out community areas with more than 20% poverty population
SELECT
     community_AREA_NUMBER
FROM
     finalproject.poverty
WHERE
     POVERTYPOPULATION_2010 > 0.2;

# Find out community areas with more than 30% population educated without degree and more than 40% population educated with degree
SELECT
     community_AREA_NUMBER,EDUCATED_WITHOUTDEGREE, EDUCATED_WITHDEGREE
FROM
     finalproject.education
WHERE
     EDUCATED_WITHOUTDEGREE > 0.3 AND
     EDUCATED_WITHDEGREE>0.4;


#Find out the crimes happened in each community area ordered by the amounts of crimes.
SELECT 
      cm.AREA_NUMBER,
      Count(c.CRIME_ID) AS Crimecount
FROM
       finalproject.crime as c
          JOIN 
       finalproject.community as cm
          JOIN
       finalproject.fact_table as f
WHERE
       c.CRIME_ID = f.crime_CRIME_ID
       AND f.community_COMMUNITY_AREA_NUMBER=cm.AREA_NUMBER
GROUP BY f.community_COMMUNITY_AREA_NUMBER
ORDER BY Crimecount DESC;
