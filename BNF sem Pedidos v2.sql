SELECT DISTINCT a.codcli, pedc.codusur AS RCA
FROM pcpedc a
JOIN pcpedc pedc ON pedc.codcli = a.codcli AND pedc.numped = a.numped and pedc.data = a.data
WHERE a.data BETWEEN SYSDATE-7 AND SYSDATE
AND a.CONDVENDA in (5,11)
AND a.posicao != 'F' AND a.posicao != 'C'
AND NOT EXISTS (SELECT 1 FROM pcpedc b
                  WHERE b.data BETWEEN SYSDATE-7 AND SYSDATE
                  AND b.CONDVENDA = 1
                  AND a.codcli = b.codcli
                  AND a.posicao != 'F' AND a.posicao != 'C')
AND a.codcli != 11185 --Premium
--Select * from pcpedc where codcli = 2166
