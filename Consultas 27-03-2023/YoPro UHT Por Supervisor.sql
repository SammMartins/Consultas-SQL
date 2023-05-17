                                    --YoPro UHT: 17883, 17884, 17885, 18173
SELECT 
    DISTINCT a.codsupervisor || ' - ' || s.nome "Supervisor",
--------------------------------------------------------------------------------------------------------------------
    (SELECT SUM(qt)/24 
     FROM pcpedi c
     JOIN pcusuari d ON c.codusur = d.codusur
     WHERE c.codprod IN (17883,17884,17885,18173)
       AND c.pvenda < 6.90
       AND c.DATA BETWEEN '1-mai-2023' AND SYSDATE
       AND d.codsupervisor = a.codsupervisor
    ) AS "Qt. Caixas",
--------------------------------------------------------------------------------------------------------------------
  ROUND( 
    ((SELECT SUM(qt)/24 
       FROM pcpedi c
       JOIN pcusuari d ON c.codusur = d.codusur
       WHERE c.codprod IN (17883,17884,17885,18173)
         AND c.pvenda < 6.90
         AND c.DATA BETWEEN '1-mai-2023' AND SYSDATE
         AND d.codsupervisor = a.codsupervisor) 
            / 
          (SELECT SUM(qt)/24 
           FROM pcpedi c
           JOIN pcusuari d ON c.codusur = d.codusur
           WHERE c.codprod IN (17883,17884,17885,18173)
             AND c.pvenda < 6.90
             AND c.DATA BETWEEN '1-mai-2023' AND SYSDATE
             AND d.codsupervisor IN (2,8,9)
          )) * 100 
,1) AS "%"
--------------------------------------------------------------------------------------------------------------------
FROM pcusuari a join PCSUPERV s on a.codsupervisor = s.codsupervisor
WHERE a.codsupervisor IN (2,8,9)

----------------------------------------------------------------------------------------------------------------------------------------
UNION ALL --União das 3 linhas com a 4ª linha com o valor total
----------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    'Total' AS "Supervisor",
    SUM(qt)/24 AS "Qt. Caixas",
    100.00 AS "%"  -- Valor fixo de 100,00 para a linha de total
FROM pcpedi c
JOIN pcusuari d ON c.codusur = d.codusur
WHERE c.codprod IN (17883,17884,17885,18173)
  AND c.pvenda < 6.90
  AND c.DATA BETWEEN '1-mai-2023' AND SYSDATE
  AND d.codsupervisor IN (2,8,9) 
  
Order By "Qt. Caixas"
