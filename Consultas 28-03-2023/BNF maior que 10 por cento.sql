SELECT DISTINCT a.codcli, pedc.codusur RCA
------------------------------------------------------------------------------------------------------------------------------------------------------
--ROUND((SUM(CASE WHEN c.CONDVENDA = 5 THEN c.vltotal ELSE 0 END) / SUM(CASE WHEN c.CONDVENDA = 1 THEN c.vltotal ELSE 0 END)) * 100, 2) AS PCT_TOTAL
------------------------------------------------------------------------------------------------------------------------------------------------------
FROM pcpedc a
JOIN pcpedc pedc ON pedc.codcli = a.codcli AND pedc.numped = a.numped and pedc.data = a.data
WHERE a.data BETWEEN SYSDATE-7 AND SYSDATE
AND a.CONDVENDA in (5,11)
AND a.posicao != 'F' AND a.posicao != 'C'
-----------------------------------------------------------------------------------------------------------------------
AND EXISTS (SELECT 1 FROM pcpedc b
                  WHERE b.data BETWEEN SYSDATE-7 AND SYSDATE
                  AND b.CONDVENDA = 1
                  AND a.codcli = b.codcli
                  AND a.posicao != 'F' AND a.posicao != 'C')
-----------------------------------------------------------------------------------------------------------------------
and ((SELECT d.vltotal FROM pcpedc d WHERE d.data BETWEEN SYSDATE-7 AND SYSDATE 
        AND d.CONDVENDA = 5 AND a.codcli = d.codcli AND ROWNUM <= 1) / 
    (SELECT e.vltotal FROM pcpedc e WHERE e.data BETWEEN SYSDATE-7 AND SYSDATE 
        AND e.CONDVENDA = 1 AND a.codcli = e.codcli AND ROWNUM <= 1)) > 0.1
-----------------------------------------------------------------------------------------------------------------------
--select * from pcpedc
