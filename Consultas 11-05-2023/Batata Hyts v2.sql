SELECT * FROM(

WITH PC_Hyts AS (
    -- CTE (Common Table Expression) para calcular as quantidades de caixas por usu�rio
    SELECT d.codusur,
           SUM(CASE WHEN d.CODPROD IN (18362, 18179, 18361, 18180) THEN d.qt ELSE 0 END) AS unidades_chips,
           SUM(CASE WHEN d.CODPROD IN (18182) THEN d.qt ELSE 0 END) AS unidades_palha,
           SUM(CASE WHEN d.CODPROD IN (18364, 18365) THEN d.qt ELSE 0 END) AS unidades_puruca
    FROM pcpedi d
    WHERE d.data BETWEEN '1-jul-2023' AND '31-jul-2023'
        AND d.posicao NOT LIKE 'C'
        AND d.vlbonific = 0
    GROUP BY d.codusur)
----------------------------------------------------------------------------------------------------------------------------------------
SELECT (u.codusur || ' - ' || u.nome) AS "Vendedor",
       FLOOR(c.unidades_chips / 24) AS "Caixas de CHIPS 40g", --FLOOR arredonda pra baixo
       FLOOR(c.unidades_palha / 24) AS "Caixas de PALHA 70g",
       FLOOR(c.unidades_puruca / 24) AS "Caixas de PURUCA 70g",
       FLOOR(((c.unidades_chips * 2) + (c.unidades_palha * 3) + (c.unidades_puruca * 2)) / 24) AS "R$ Total"
FROM PCUSUARI u
    JOIN PC_Hyts c ON u.codusur = c.codusur
WHERE u.codusur IN (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174)
----------------------------------------------------------------------------------------------------------------------------------------
UNION ALL --Utilizada para realizar a uni�o de duas consultas, combinando os resultados em um �nico conjunto de resultados
SELECT 
    '    - DESEMPENHO TOTAL DA EQUIPE' AS "Vendedor",
    FLOOR(SUM(c.unidades_chips / 24)) AS "Caixas de CHIPS 40g",
    FLOOR(SUM(c.unidades_palha / 24)) AS "Caixas de PALHA 70g",
    FLOOR(SUM(c.unidades_puruca / 24)) AS "Caixas de PURUCA 70g",
    FLOOR(SUM(((c.unidades_chips * 2) + (c.unidades_palha * 3) + (c.unidades_puruca * 2)) / 24)) AS "R$ Total"   
FROM PC_Hyts c
    where c.codusur in (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174)

)ORDER BY
       CASE WHEN "Vendedor" LIKE '    - DESEMPENHO TOTAL DA EQUIPE' THEN 1 ELSE 0 END
