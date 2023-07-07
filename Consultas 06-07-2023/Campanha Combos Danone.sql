WITH Contagem AS
    (SELECT
        COUNT(DISTINCT p.numped) AS cont,
        p.codusur AS rca,
        LISTAGG(p.codcli, ', ') WITHIN GROUP (ORDER BY p.codcli) AS clientes
    FROM
        (SELECT
            p.*,
            ROW_NUMBER() OVER (PARTITION BY p.codusur, p.codcli ORDER BY p.codcli) AS rn
        FROM PCPEDI p
        WHERE p.CODCOMBO IN (118, 119, 120) 
        AND p.data BETWEEN '01-jul-2023' AND SYSDATE) p
        
    WHERE p.rn = 1
    GROUP BY p.codusur
)

SELECT
    (u.codusur || ' - ' || u.nome) AS "Vendedor",
    'R$'|| (CASE WHEN c.cont IS NULL THEN 0 ELSE c.cont END) AS "R$",
    c.clientes "Clientes Atendidos"
FROM PCUSUARI u
LEFT JOIN Contagem c ON u.codusur = c.rca
WHERE u.codusur IN (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174)

UNION ALL 
SELECT '                                - TOTAL:' AS "Vendedor",
       ' R$'||SUM(c.cont) AS "R$",
       LISTAGG(c.clientes, ', ') WITHIN GROUP (ORDER BY c.clientes) AS "Clientes Atendidos"
FROM Contagem c 
ORDER BY "R$" desc, "Vendedor" ASC
