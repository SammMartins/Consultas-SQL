SELECT a.codcli, pedc.codusur AS RCA, 
ROUND((SUM(CASE WHEN c.CONDVENDA = 5 THEN c.vltotal ELSE 0 END) / SUM(CASE WHEN c.CONDVENDA = 1 THEN c.vltotal ELSE 0 END)) * 100, 2) AS "%"
FROM pcpedc a
JOIN pcpedc pedc ON pedc.codcli = a.codcli AND pedc.numped = a.numped and pedc.data = a.data
JOIN pcpedc c ON c.codcli = a.codcli AND c.data BETWEEN SYSDATE-7 AND SYSDATE
WHERE a.data BETWEEN SYSDATE-7 AND SYSDATE
AND a.CONDVENDA in (5,11)
AND a.posicao NOT IN ('F', 'C')
AND EXISTS (SELECT 1 FROM pcpedc b
                  WHERE b.data BETWEEN SYSDATE-7 AND SYSDATE
                  AND b.CONDVENDA = 1
                  AND a.codcli = b.codcli
                  and b.codcli != 11185 and b.codusur not in (2,8,9,10)              
                  AND a.posicao NOT IN ('F', 'C'))
GROUP BY a.codcli, pedc.codusur
HAVING (SUM(CASE WHEN c.CONDVENDA = 5 THEN c.vltotal ELSE 0 END) / SUM(CASE WHEN c.CONDVENDA = 1 THEN c.vltotal ELSE 0 END)) > 0.1
ORDER BY "%" DESC;
