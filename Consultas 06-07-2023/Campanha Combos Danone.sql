WITH Contagem AS
(SELECT COUNT(DISTINCT p.numped) AS cont,
        p.codusur AS rca,
        SUM(CASE WHEN p.CODCOMBO = 118 THEN 1 ELSE 0 END) AS combo1,
        SUM(CASE WHEN p.CODCOMBO = 119 THEN 1 ELSE 0 END) AS combo2,
        SUM(CASE WHEN p.CODCOMBO = 120 THEN 1 ELSE 0 END) AS combo3,
        LISTAGG(CASE WHEN p.CODCOMBO = 118 THEN p.codcli ELSE NULL END, ', ') WITHIN GROUP (ORDER BY p.codcli) AS clientes_118,
        LISTAGG(CASE WHEN p.CODCOMBO = 119 THEN p.codcli ELSE NULL END, ', ') WITHIN GROUP (ORDER BY p.codcli) AS clientes_119,
        LISTAGG(CASE WHEN p.CODCOMBO = 120 THEN p.codcli ELSE NULL END, ', ') WITHIN GROUP (ORDER BY p.codcli) AS clientes_120
    FROM (SELECT p.*, ROW_NUMBER() OVER (PARTITION BY p.codusur, p.codcli ORDER BY p.codcli) AS rn
            FROM PCPEDI p
            WHERE p.CODCOMBO IN (118, 119, 120) AND p.data BETWEEN '01-jul-2023' AND SYSDATE) p
    WHERE p.rn = 1
    GROUP BY p.codusur),
-----------------------------------------------------------------------------------------------------------------------
Invest AS (SELECT SUM((ped.qt*ped.pvenda)) + ((SUM((ped.qt*ped.pvenda))) * 0.1) PrecoTabela,
                  (SUM((ped.qt*ped.pvenda)) + ((SUM((ped.qt*ped.pvenda))) * 0.1)) * 0.1 Invest,
                  SUM((ped.qt*ped.pvenda)) PrecoVenda, ped.codusur AS rca
          FROM (SELECT p.* FROM PCPEDI p WHERE p.CODCOMBO IN (118, 119, 120) AND p.data BETWEEN '01-jul-2023' AND SYSDATE) ped
          GROUP BY ped.codusur)
-----------------------------------------------------------------------------------------------------------------------
SELECT  (u.codusur || ' - ' || SUBSTR(u.nome,4,15)) AS "Vendedor",
        'R$'|| (CASE WHEN c.cont IS NULL THEN 0 ELSE c.cont END) AS "R$",
        c.combo1 AS "Combo 1", c.combo2 AS "Combo 2", c.combo3 AS "Combo 3",
        i.invest "Investimento", i.PrecoVenda "Faturado", c.clientes_118 AS "Clientes Atendidos Combo 1", 
        c.clientes_119 AS "Clientes Atendidos Combo 2", c.clientes_120 AS "Clientes Atendidos Combo 3"
FROM PCUSUARI u
    LEFT JOIN Contagem c ON u.codusur = c.rca
    JOIN Invest i on i.rca = u.codusur
WHERE u.codusur IN (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174)
-----------------------------------------------------------------------------------------------------------------------
UNION ALL 
SELECT  '                       - TOTAL:' AS "Vendedor",
        ' R$'||SUM(c.cont) AS "R$",
        SUM(c.combo1) AS "Combo 1", SUM(c.combo2) AS "Combo 2", SUM(c.combo3) AS "Combo 3",
        SUM(i.invest) "Investimento", SUM(i.PrecoVenda) "Faturado",
        LISTAGG(c.clientes_118, ', ') WITHIN GROUP (ORDER BY c.clientes_118) AS "Clientes Atendidos 118",
        LISTAGG(c.clientes_119, ', ') WITHIN GROUP (ORDER BY c.clientes_119) AS "Clientes Atendidos 119",
        LISTAGG(c.clientes_120, ', ') WITHIN GROUP (ORDER BY c.clientes_120) AS "Clientes Atendidos 120"
FROM Contagem c 
JOIN Invest i on i.rca = c.rca
GROUP BY '                       - TOTAL:'
ORDER BY "Vendedor" DESC

