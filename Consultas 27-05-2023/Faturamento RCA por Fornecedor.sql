WITH VARIALVEIS AS (SELECT '01-abr-2022' AS "DT1",'30-abr-2022' AS "DT2" from DUAL),
--------------------------------------------------------------------------------------------------------------------------------------    
    DANONE2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a
    JOIN pcprodut b on a.codprod = b.codprod 
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 588
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------------    
    SULMINAS2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1321
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------    
    DAFRUTA2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1225
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    SANTAMASSA2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1623
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    BIVOLT2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1634
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    MASSALEVE2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1541
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    HYTS2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1607
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    FRUTAP2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1728
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    FLORESTAL2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1727
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    AVINOR2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 98
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    GULOZITOS2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1719
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    DOCILE2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1627
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur),
--------------------------------------------------------------------------------------------------------------------------------        
    NUTRICAL2022 AS
    (SELECT DISTINCT a.codusur,
           NVL(SUM(a.qt * a.punit),0) faturamento
    FROM pcmov a 
    JOIN pcprodut b on a.codprod = b.codprod
    JOIN VARIALVEIS c on a.codprod = b.codprod 
    WHERE b.codfornec = 1761
    AND a.codusur in (141,140,142,153,164,157,158,155,156,167,169,170,172,148,150,151,152,168,174)
    AND a.dtmov BETWEEN "DT1" AND "DT2"
    GROUP BY a.codusur)   
--------------------------------------------------------------------------------------------------------------------------------        
SELECT (u.codusur || ' - ' || u.nome) AS "Vendedor",
        NVL(d.faturamento,0) AS DANONE, NVL(e.faturamento,0) AS Dafruta,
         NVL(j.faturamento,0) AS "MASSA LEVE", NVL(g.faturamento,0) AS DOCILE, 
         NVL(m.faturamento,0) AS HYTS, NVL(n.faturamento,0) AS "SANTA MASSA", NVL(o.faturamento,0) AS SULMINAS
        --,k.faturamento AS BIVOLT,f.faturamento AS NUTRICAL, p.faturamento AS FRUTAP,,l.faturamento AS FLORESTAL,h.faturamento AS GULOZITOS,
        
FROM PCUSUARI u,DANONE2022 d,DAFRUTA2022 e,DOCILE2022 g,AVINOR2022 i,
                MASSALEVE2022 j,HYTS2022 m,SANTAMASSA2022 n,SULMINAS2022 o
                --,BIVOLT2022 k,NUTRICAL2022 f,FRUTAP2022 p,FLORESTAL2022 l,GULOZITOS2022 h,
WHERE u.codusur IN (141)
AND d.codusur = u.codusur 
AND e.codusur = u.codusur 
AND m.codusur = u.codusur 
AND n.codusur = u.codusur 
AND o.codusur = u.codusur
AND g.codusur = u.codusur
AND i.codusur = u.codusur 
AND j.codusur = u.codusur 
--AND f.codusur = u.codusur 
--AND h.codusur = u.codusur 
--AND k.codusur = u.codusur
--AND l.codusur = u.codusur 
--AND p.codusur = u.codusur

    
    
    
