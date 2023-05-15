WITH caixas AS (
    -- CTE (Common Table Expression) para calcular as quantidades de caixas por usuário
    SELECT d.codusur,
           SUM(CASE WHEN d.CODPROD IN (18362, 18179, 18361, 18180) THEN d.qt ELSE 0 END) AS caixas_chips,
           SUM(CASE WHEN d.CODPROD IN (18182) THEN d.qt ELSE 0 END) AS caixas_palha,
           SUM(CASE WHEN d.CODPROD IN (18364, 18365) THEN d.qt ELSE 0 END) AS caixas_puruca
    FROM pcpedi d
    WHERE d.data BETWEEN TO_DATE('1-mai-2023', 'DD-MON-YYYY') AND SYSDATE
        AND d.posicao NOT LIKE 'C'
    GROUP BY d.codusur
)
SELECT (u.codusur || ' - ' || u.nome) AS "Vendedor",
       c.caixas_chips / 24 AS "Caixas de CHIPS 40g",
       c.caixas_palha / 24 AS "Caixas de PALHA 70g",
       c.caixas_puruca / 24 AS "Caixas de PURUCA 70g",
       ((c.caixas_chips * 2) + (c.caixas_palha * 3) + (c.caixas_puruca * 2)) / 24 AS "R$ Total"
FROM PCUSUARI u
JOIN caixas c ON u.codusur = c.codusur
WHERE u.codusur IN (140, 141, 142, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 164, 167, 168, 169, 170, 172, 174)
----------------------------------------------------------------------------------------------------------------------------------------
UNION ALL
----------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    'Desempenho Total da Equipe' AS "Vendedor",
    SUM(c.caixas_chips / 24) AS "Caixas de CHIPS 40g",
    SUM(c.caixas_palha / 24) AS "Caixas de PALHA 70g",
    SUM(c.caixas_puruca / 24) AS "Caixas de PURUCA 70g",
    SUM(((c.caixas_chips * 2) + (c.caixas_palha * 3) + (c.caixas_puruca * 2)) / 24) AS "R$ Total"
    
FROM caixas c
    where c.codusur in (140, 141, 142, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 164, 167, 168, 169, 170, 172, 174)
