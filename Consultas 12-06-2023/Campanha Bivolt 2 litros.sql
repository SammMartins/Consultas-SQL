SELECT * FROM(

--------------------------------------------------------------
  WITH Bivolt AS 
    (SELECT c.data,
            a.codusur,
            (SUM(c.qt))/6 Fardos,
            (c.qt*7.15) - (c.qt*c.pvenda) INVEST,
            c.codcli,
            c.pvenda
      FROM pcusuari a
      JOIN PCSUPERV s ON a.codsupervisor = s.codsupervisor
      JOIN pcpedi c ON c.codusur = a.codusur
      JOIN pcusuari d ON c.codusur = d.codusur
      WHERE a.codsupervisor IN (2, 8)
        AND c.codprod IN (18329)
        AND c.pvenda < 6.40
        AND c.DATA BETWEEN '01-jun-2023' AND SYSDATE
        AND c.vlbonific = 0
        AND d.codsupervisor = a.codsupervisor
        GROUP BY a.codusur,c.codcli,c.qt,c.pvenda,c.data)
        
-------------------------------------------------------------------------------------------------------------------------    

SELECT  TO_CHAR(b.data, 'DD/MM/yy') data,
        (u.codusur || ' - ' || u.nome) AS vendedor,
        (b.codcli || ' - ' || c.cliente) AS cliente,
        b.fardos fardos,
        'R$' || REPLACE(b.pvenda, '.', ',') AS "R$",
        'R$' || REPLACE(b.INVEST, '.', ',') AS INVESTIMENTO
        
        
    FROM PCUSUARI u 
    JOIN Bivolt b on u.codusur =  b.codusur
    JOIN pcclient c on b.codcli = c.codcli
UNION ALL 
SELECT NULL AS data,
       NULL AS vendedor,
'                       Investimento Total:' AS cliente,
       NULL AS fardos,
       NULL AS "R$",
       'R$' ||REPLACE(SUM(bi.INVEST), '.', ',') AS INVESTIMENTO
FROM Bivolt bi 
--------------------------------------------------------------

    )ORDER BY
    CASE WHEN fardos IS NULL THEN 1 ELSE 0 END,
    fardos asc
