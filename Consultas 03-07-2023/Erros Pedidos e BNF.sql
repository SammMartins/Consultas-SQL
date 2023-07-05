SELECT
    ped.codcli "Cliente",
    pedc.codusur AS RCA,
    'Possível Duplicidade' as Tipo
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
    
UNION ALL
SELECT DISTINCT a.codcli "Cliente",
                pedc.codusur AS RCA,
                'BNF SEM PEDIDO' as Tipo
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
