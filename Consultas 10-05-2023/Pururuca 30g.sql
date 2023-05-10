SELECT a.codusur || SUBSTR(b.nome,7,50) "Vendedor",
       (SUM(a.qt))/24 "Caixas Totais",
       a.codprod || ' - ' || c.descricao Produto,
       
       (CASE WHEN a.CODPROD in (18364,18365) THEN ( (SUM (a.qt) ) /24 ) * 2 ELSE 0 END) "2x R$"
       
       
FROM PCMOV a 
JOIN PCUSUARI b on a.codusur = b.codusur
JOIN pcprodut c on a.codprod = c.codprod

WHERE a.CODPROD in (18364,18365)
AND a.DTMOV BETWEEN '1-mai-2023' and SYSDATE
AND b.codusur in (140,141,142,145,148,150,151,152,153,155,156,157,158,164,167,168,169,170,172,174)
                    
GROUP BY a.codusur,b.nome,a.codprod,c.descricao
