SELECT *
FROM USHouseholdIncome;

SELECT *
FROM ushouseholdincome_statistics;

SELECT State_Name, SUM(ALand), SUM(Awater)
FROM USHouseholdIncome
GROUP BY State_Name
ORDER BY 2 DESC;

SELECT *
FROM USHouseholdIncome u
JOIN ushouseholdincome_statistics us
	ON u.id = us.id;
    
SELECT u.State_Name, 
	ROUND(AVG(us.mean), 1),
	ROUND(AVG(us.median), 1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 5;


SELECT 'primary' AS Type,
	ROUND(AVG(us.mean), 1),
	ROUND(AVG(us.median), 1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

SELECT Type, COUNT(Type),
	ROUND(AVG(us.mean), 1),
	ROUND(AVG(us.median), 1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
	ON u.id = us.id
WHERE MEAN <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 1 DESC
LIMIT 20;

SELECT u.State_Name, City, ROUND(AVG(Mean),1)
FROM USHouseholdIncome u
JOIN ushouseholdincome_statistics us
	ON u.id = us.id
GROUP BY u.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC;

