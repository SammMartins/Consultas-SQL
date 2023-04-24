SELECT
    ped.codcli "Cliente",
    pedc.codusur AS "RCA"
FROM
    pcpedi ped
JOIN
    pcpedc pedc ON ped.codcli = pedc.codcli
AND ped.numped = pedc.numped
AND ped.data = pedc.data
LEFT JOIN
    (
    SELECT
        ped2.codcli,
        ped2.codprod
    FROM
        pcpedi ped2
    JOIN
        pcpedc pedc2 ON ped2.numped = pedc2.numped
    WHERE
        ped2.data BETWEEN SYSDATE-7 AND SYSDATE
    AND ped2.posicao NOT IN ('F', 'C')
    AND pedc2.CONDVENDA NOT IN (5, 11)
    GROUP BY
        ped2.codcli,
        ped2.codprod
    HAVING COUNT(*) > 1
    ) ped2 ON ped.codcli = ped2.codcli
WHERE
    ped.data BETWEEN SYSDATE-7 AND SYSDATE
AND ped.posicao NOT IN ('F', 'C')
AND pedc.CONDVENDA NOT IN (5, 11)
AND ped2.codcli IS NOT NULL
GROUP BY
    ped.codcli,
    pedc.codusur
