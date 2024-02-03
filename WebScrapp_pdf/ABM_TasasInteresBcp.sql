-- ###########################################################################
-- DA: Rodrigo Figueredo
	USE AdventureWorksDW2019;
-- ###  ABM tabla Tasas Intereses BCP

SELECT distinct CAST(FechaCierre AS DATE) FechaCierre, FechaProceso  
FROM dbo.tasasInteres_TMP
order by CAST(FechaCierre AS DATE) desc

drop table dbo.tasasInteres_TMP

SELECT *  
FROM dbo.tasasInteres_TMP
where FechaCierre is null

UPDATE dbo.tasasInteres_TMP
	SET FechaCierre='2022-09-01'
WHERE FechaCierre is null

delete from dbo.tasasInteres_TMP
where FechaProceso = '17:24:09'

SELECT CAST(FechaCierre AS DATE) AS FechaCierre, ROUND(AVG(VALUE),2) AS PromedioInteres 
FROM dbo.tasasInteres_TMP
GROUP BY CAST(FechaCierre AS DATE)
ORDER BY 1 