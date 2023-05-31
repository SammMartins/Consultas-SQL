WITH VERBA AS 
(SELECT a.codusur as RCA, 
       SUM(CASE WHEN (a.ptabela - a.punit) < 0 THEN (a.ptabela - a.punit) * a.qt ELSE 0 END) AS Verba
FROM PCMOV a
WHERE a.dtmov BETWEEN '01-mai-2023' AND SYSDATE
  AND a.codusur in (140, 141, 142, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 164, 167, 168, 169, 170, 172, 174)
GROUP BY a.codusur
Order By RCA)

SELECT u.codusur,u.nome AS Nome,
       a.Verba AS TOTAL_DESCONTO
        
FROM PCUSUARI u
    JOIN VERBA a ON u.codusur = a.RCA
WHERE u.codusur IN (140, 141, 142, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 164, 167, 168, 169, 170, 172, 174)

