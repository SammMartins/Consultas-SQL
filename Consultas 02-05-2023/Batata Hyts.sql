SELECT DISTINCT (a.codusur || ' - ' || b.nome) "Vendedor",
-------------------------------------------------------------------------------------------------------------------------        
    (SELECT SUM(d.qt) FROM pcpedi d
        WHERE d.CODPROD IN (18362, 18179, 18361, 18180) AND d.data BETWEEN '1-mai-2023' AND SYSDATE
        AND d.codusur = a.codusur
        AND d.posicao Not LIKE 'C') / 24 AS "Caixas de CHIPS 40g",
-------------------------------------------------------------------------------------------------------------------------        
    (SELECT SUM(d.qt) FROM pcpedi d
        WHERE d.CODPROD IN (18182) AND d.data BETWEEN '1-mai-2023' AND SYSDATE
        AND d.codusur = a.codusur
        AND d.posicao Not LIKE 'C') / 24 AS "Caixas de PALHA 70g",
-------------------------------------------------------------------------------------------------------------------------        
    (SELECT SUM(d.qt) FROM pcpedi d
        WHERE d.CODPROD IN (18364, 18365) AND d.data BETWEEN '1-mai-2023' AND SYSDATE
        AND d.codusur = a.codusur
        AND d.posicao Not LIKE 'C') / 24 AS "Caixas de PURUCA 70g",
-------------------------------------------------------------------------------------------------------------------------                
    (SELECT (SUM(CASE WHEN d.CODPROD IN (18362, 18179, 18361, 18180) THEN d.qt * 2 ELSE 0 END) +
             SUM(CASE WHEN d.CODPROD IN (18182) THEN d.qt * 3 ELSE 0 END) +
             SUM(CASE WHEN d.CODPROD IN (18364, 18365) THEN d.qt * 2 ELSE 0 END)) / 24 AS qt
        FROM pcpedi d
        WHERE d.codusur = a.codusur
        AND d.posicao Not LIKE 'C'
        and d.data BETWEEN '1-mai-2023' AND SYSDATE) AS "R$ Total"
-------------------------------------------------------------------------------------------------------------------------                     
FROM pcpedi a
    JOIN PCUSUARI b ON a.codusur = b.codusur
    JOIN pcprodut c ON a.codprod = c.codprod
WHERE a.CODPROD IN (18362, 18179, 18361, 18180, 18182, 18364, 18365)
    AND a.data BETWEEN '1-mai-2023' AND SYSDATE
    AND b.codusur IN (140, 141, 142, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 164, 167, 168, 169, 170, 172, 174)
    AND a.posicao Not LIKE 'C'
GROUP BY a.codprod, a.codusur, b.nome;


--select * from pcpedi
