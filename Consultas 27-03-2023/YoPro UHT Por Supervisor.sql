SELECT 
    DISTINCT a.codsupervisor,
--------------------------------------------------------------------------------------------------------------------
    (SELECT SUM(qt)/24 
     FROM pcpedi c
     JOIN pcusuari d ON c.codusur = d.codusur
     WHERE c.codprod IN (17883,17884,17885,18173)
       AND c.pvenda < 6.99
       AND c.DATA BETWEEN '1-mai-2023' AND SYSDATE
       AND d.codsupervisor = a.codsupervisor
    ) AS qtCaixas,
--------------------------------------------------------------------------------------------------------------------
  ROUND( 
    ((SELECT SUM(qt)/24 
       FROM pcpedi c
       JOIN pcusuari d ON c.codusur = d.codusur
       WHERE c.codprod IN (17883,17884,17885,18173)
         AND c.pvenda < 6.99
         AND c.DATA BETWEEN '1-mai-2023' AND SYSDATE
         AND d.codsupervisor = a.codsupervisor) 
            / 
          (SELECT SUM(qt)/24 
           FROM pcpedi c
           JOIN pcusuari d ON c.codusur = d.codusur
           WHERE c.codprod IN (17883,17884,17885,18173)
             AND c.pvenda < 6.99
             AND c.DATA BETWEEN '1-mai-2023' AND SYSDATE
             AND d.codsupervisor IN (2,8,9)
          )) * 100 
,1) AS porcentagem
--------------------------------------------------------------------------------------------------------------------
FROM pcusuari a
WHERE a.codsupervisor IN (2,8,9)

                                    --YoPro UHT: 17883, 17884, 17885, 18173
