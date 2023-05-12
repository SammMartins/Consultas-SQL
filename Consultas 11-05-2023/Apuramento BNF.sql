SELECT *
FROM PCCLIENT a
WHERE EXISTS (
    SELECT *
    FROM PCPEDC C
    WHERE C.CONDVENDA IN (5, 11)
        AND C.VLTOTAL > 200
        AND C.CODCLI = a.CODCLI
        AND a.Codcli != 11185
        AND C.DATA > SYSDATE - (366 * 2)
    HAVING COUNT(*) > 5)

