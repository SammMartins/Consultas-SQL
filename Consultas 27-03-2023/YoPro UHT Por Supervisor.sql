WITH addyopro AS (SELECT 0 AS ADDJR, 14 AS ADDDIDA, 300 AS GAP FROM DUAL),
qt_caixas AS (
  SELECT
    a.codsupervisor || ' - ' || SUBSTR(s.nome,0,15) AS "Supervisor",
    (CASE WHEN d.codsupervisor = 2 THEN (SUM(c.qt)/24)+ad.adddida ELSE (SUM(c.qt)/24)+ad.addjr END) AS "Cx. Vendidas",
    ad.gap - (CASE WHEN d.codsupervisor = 2 THEN (SUM(c.qt)/24)+ad.adddida ELSE (SUM(c.qt)/24)+ad.addjr END) AS GAP
  FROM pcusuari a
  JOIN PCSUPERV s ON a.codsupervisor = s.codsupervisor
  JOIN pcpedi c ON c.codusur = a.codusur
  JOIN addyopro ad ON 1 = 1
  JOIN pcusuari d ON c.codusur = d.codusur
  WHERE a.codsupervisor IN (2, 8)
    AND c.codprod IN (17883, 17884, 17885, 18173)
    AND c.pvenda < 6.90
    AND c.DATA BETWEEN '01-jun-2023' AND SYSDATE
    AND c.vlbonific = 0
    AND d.codsupervisor = a.codsupervisor
  GROUP BY a.codsupervisor, s.nome, d.codsupervisor, ad.adddida, ad.addjr,ad.gap
)
SELECT
  "Supervisor",
  -GAP AS GAP,
  "Cx. Vendidas",
  ROUND(("Cx. Vendidas" / (SELECT SUM(qt_caixas."Cx. Vendidas") FROM qt_caixas WHERE qt_caixas."Supervisor" != '  - Total')) * 100, 0) AS "%"
FROM qt_caixas

UNION ALL

SELECT
  '  - TOTAL' AS "Supervisor",
  -((ad.gap*2) - ((SUM(qt)/24) + ad.adddida + ad.addjr)) AS GAP,
  (SUM(qt)/24) + ad.adddida + ad.addjr AS "Cx. Vendidas",
  100.00 AS "%"
FROM pcpedi c
JOIN pcusuari d ON c.codusur = d.codusur
JOIN addyopro ad ON 1 = 1
WHERE c.codprod IN (17883,17884,17885,18173)
  AND c.pvenda < 6.90
  AND c.DATA BETWEEN '01-jun-2023' AND SYSDATE
  AND c.vlbonific = 0
  AND d.codsupervisor IN (2,8)
GROUP BY ad.adddida, ad.addjr,ad.gap
ORDER BY "Cx. Vendidas";

