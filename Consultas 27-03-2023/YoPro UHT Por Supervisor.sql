WITH addyopro AS 
( SELECT 0 AS ADDJR,0 AS ADDDIDA FROM DUAL)


                                    --YoPro UHT: 17883, 17884, 17885, 18173
SELECT 
    DISTINCT a.codsupervisor || ' - ' || s.nome "Supervisor",
--------------------------------------------------------------------------------------------------------------------
    (SELECT (CASE WHEN d.codsupervisor = 2 THEN (SUM(c.qt)/24)+ad.adddida ELSE (SUM(c.qt)/24)+ad.addjr END )
     FROM pcpedi c, addyopro ad, pcusuari d
     WHERE c.codprod IN (17883,17884,17885,18173)
       AND c.pvenda < 6.90
       AND c.DATA BETWEEN '1-jun-2023' AND SYSDATE
       AND d.codsupervisor = a.codsupervisor
       AND c.vlbonific = 0
       AND c.codusur = d.codusur
       Group BY d.codsupervisor,ad.adddida,ad.addjr
    ) AS "Qt. Caixas",
--------------------------------------------------------------------------------------------------------------------
  ROUND( 
    ((SELECT (CASE WHEN d.codsupervisor = 2 THEN (SUM(c.qt)/24)+ad.adddida ELSE (SUM(c.qt)/24)+ad.addjr END )
       FROM pcpedi c, addyopro ad, pcusuari d
       WHERE c.codprod IN (17883,17884,17885,18173)
         AND c.pvenda < 6.90
         AND c.DATA BETWEEN '1-jun-2023' AND SYSDATE
         AND c.vlbonific = 0
         AND c.codusur = d.codusur
         AND d.codsupervisor = a.codsupervisor
         Group BY d.codsupervisor,ad.adddida,ad.addjr) 
            / 
          (SELECT (CASE WHEN d.codsupervisor = 2 THEN (SUM(c.qt)/24)+ad.adddida ELSE (SUM(c.qt)/24)+ad.addjr END )
           FROM pcpedi c, addyopro ad, pcusuari d
           WHERE c.codprod IN (17883,17884,17885,18173)
             AND c.pvenda < 6.90
             AND c.DATA BETWEEN '1-jun-2023' AND SYSDATE
             AND c.vlbonific = 0
             AND c.codusur = d.codusur
             AND d.codsupervisor IN (2,8,9)
          Group BY d.codsupervisor,ad.adddida,ad.addjr)) * 100 
,1) AS "%"
--------------------------------------------------------------------------------------------------------------------
FROM pcusuari a join PCSUPERV s on a.codsupervisor = s.codsupervisor
WHERE a.codsupervisor IN (2,8)

----------------------------------------------------------------------------------------------------------------------------------------
UNION ALL --União das 2 linhas com a 4ª linha com o valor total
----------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    'Total' AS "Supervisor",
    SUM(qt)/24 AS "Qt. Caixas",
    100.00 AS "%"  -- Valor fixo de 100,00 para a linha de total
FROM pcpedi c
JOIN pcusuari d ON c.codusur = d.codusur
WHERE c.codprod IN (17883,17884,17885,18173)
  AND c.pvenda < 6.90
  AND c.DATA BETWEEN '1-jun-2023' AND SYSDATE
  AND c.vlbonific = 0
  AND d.codsupervisor IN (2,8) 
  
Order By "Qt. Caixas"
