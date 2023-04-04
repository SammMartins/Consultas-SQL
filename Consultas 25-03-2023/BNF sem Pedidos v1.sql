SELECT DISTINCT a.codcli,
                (Select pedc.codusur from pcpedc pedc where pedc.codcli = a.codcli AND pedc.numped = a.numped AND ROWNUM <= 1) RCA
FROM pcpedc a
WHERE a.data BETWEEN SYSDATE-7 AND SYSDATE
AND a.CONDVENDA in (5,11)
AND (SELECT COUNT(distinct b.codcli) FROM pcpedc b
                  WHERE b.data BETWEEN SYSDATE-7 AND SYSDATE
                  AND b.CONDVENDA = 1
                  AND a.codcli = b.codcli) < 1
and a.codcli != 11185 --Premium
--Select * from pcpedc where codcli = 2166
