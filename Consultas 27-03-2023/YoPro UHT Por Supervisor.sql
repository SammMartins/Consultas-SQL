WITH addyopro AS (SELECT 0 AS ADDJR, 0 AS ADDDIDA FROM DUAL), -- Para adição manual de caixas
qt_caixas AS (
  SELECT 
    a.codsupervisor || ' - ' || s.nome AS "Supervisor",
------------------------------------------------------------------------------------------------------------------------    
    (CASE WHEN d.codsupervisor = 2 THEN (SUM(c.qt)/24)+ad.adddida ELSE (SUM(c.qt)/24)+ad.addjr END) AS "Qt. Caixas"
  FROM pcusuari a
  JOIN PCSUPERV s ON a.codsupervisor = s.codsupervisor
  JOIN pcpedi c ON c.codusur = a.codusur
  JOIN addyopro ad ON 1 = 1
  JOIN pcusuari d ON c.codusur = d.codusur
  WHERE a.codsupervisor IN (2, 8)
    AND c.codprod IN (17883, 17884, 17885, 18173)
    AND c.pvenda < 6.90
    AND c.DATA BETWEEN '1-jun-2023' AND SYSDATE
    AND c.vlbonific = 0
    AND d.codsupervisor = a.codsupervisor
  GROUP BY a.codsupervisor, s.nome, d.codsupervisor, ad.adddida, ad.addjr)
------------------------------------------------------------------------------------------------------------------------
SELECT
  "Supervisor",
  "Qt. Caixas",
  ROUND(
    ("Qt. Caixas" / (
      SELECT SUM(qt_caixas."Qt. Caixas")
      FROM qt_caixas
      WHERE qt_caixas."Supervisor" != 'Total'
    )) * 100, 0
  ) AS "%"
FROM qt_caixas
------------------------------------------------------------------------------------------------------------------------
UNION ALL

SELECT 
  'Total' AS "Supervisor",
  SUM(qt)/24 AS "Qt. Caixas",
  100.00 AS "%"  
FROM pcpedi c
JOIN pcusuari d ON c.codusur = d.codusur
WHERE c.codprod IN (17883,17884,17885,18173)
  AND c.pvenda < 6.90
  AND c.DATA BETWEEN '1-jun-2023' AND SYSDATE
  AND c.vlbonific = 0
  AND d.codsupervisor IN (2,8) 

ORDER BY "Qt. Caixas";
