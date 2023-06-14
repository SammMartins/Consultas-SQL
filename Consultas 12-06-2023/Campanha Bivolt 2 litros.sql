SELECT * FROM
(
  WITH Bivolt AS 
    (SELECT c.data,
            a.codusur,
            (SUM(c.qt))/6 Fardos,
            (c.qt*7.15) - (c.qt*c.pvenda) INVEST,
            c.codcli
        --(CASE WHEN d.codsupervisor = 2 THEN (SUM(c.qt)/24)+ad.adddida ELSE (SUM(c.qt)/24)+ad.addjr END) AS "Qt. Caixas"
      FROM pcusuari a
      JOIN PCSUPERV s ON a.codsupervisor = s.codsupervisor
      JOIN pcpedi c ON c.codusur = a.codusur
      JOIN pcusuari d ON c.codusur = d.codusur
      WHERE a.codsupervisor IN (2, 8)
        AND c.codprod IN (18329)
        AND c.pvenda < 6.29
        --AND c.qt > 120
        AND c.DATA BETWEEN '01-jun-2023' AND SYSDATE
        AND c.vlbonific = 0
        AND d.codsupervisor = a.codsupervisor
        GROUP BY a.codusur,c.codcli,c.qt,c.pvenda,c.data)
    
SELECT  TO_CHAR(b.data, 'DD/MM') data,
        (u.codusur || ' - ' || u.nome) AS vendedor,
        (b.codcli || ' - ' || c.cliente) AS cliente,
        b.fardos fardos,
        'R$' || b.INVEST AS INVESTIMENTO
        
    FROM PCUSUARI u 
    JOIN Bivolt b on u.codusur =  b.codusur
    JOIN pcclient c on b.codcli = c.codcli
UNION ALL 
SELECT NULL AS data,
       NULL AS vendedor,
       'Investimento Total:' AS cliente,
       NULL AS fardos,
       'R$' ||SUM(bi.INVEST) AS INVESTIMENTO
FROM Bivolt bi
)
ORDER BY
CASE WHEN "COD" IS NULL THEN 1 ELSE 0 END,
"DN DISTINTOS" DESC
