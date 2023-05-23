WITH FaturamentoDocile AS 
    (SELECT ped.codusur as RCA,
            SUM(ped.qt*ped.pvenda) as Faturamento
    FROM PCPEDI ped
        JOIN pcprodut prod on ped.codprod = prod.codprod
    WHERE prod.codfornec = 1627
        AND ped.data BETWEEN '01-mai-2023' and SYSDATE
        AND ped.posicao LIKE 'F'
        AND ped.vlbonific = 0
    Group By ped.codusur)
-----------------------------------------------------------------------------------------------------------------------
    WITH DNMAIO AS
        (SELECT ped.codusur AS RCA,
                COUNT(DISTINCT ped.codcli) AS "POSITIVAÇÃO GERAL MAIO"
            FROM PCPEDI ped
                JOIN pcprodut prod on ped.codprod = prod.codprod
            WHERE prod.codfornec = 1627
                AND ped.data BETWEEN '01-mai-2023' and '31-mai-2023'
                AND ped.posicao LIKE 'F'
                AND ped.vlbonific = 0
            GROUP BY ped.codusur)
--------------------------------------------------------------------------------
    WITH DNJUNHO AS 
        (SELECT ped.codusur AS RCA,
                COUNT(DISTINCT ped.codcli) AS "POSITIVAÇÃO GERAL JUNHO"
            FROM PCPEDI ped
                JOIN pcprodut prod on ped.codprod = prod.codprod
            WHERE prod.codfornec = 1627
                AND ped.data BETWEEN '01-jun-2023' and '30-jun-2023'
                AND ped.posicao LIKE 'F'
                AND ped.vlbonific = 0
            GROUP BY ped.codusur)
-----------------------------------------------------------------------------------------------------------------------
WITH DNDISTINCT AS
    (SELECT ped.codusur AS RCA,
            COUNT(DISTINCT ped.codcli) AS "POSITIVAÇÃO CLIENTES DISTINTOS" --Maio e Junho
    FROM PCPEDI ped
        JOIN pcprodut prod on ped.codprod = prod.codprod
    WHERE prod.codfornec = 1627
        AND ped.data BETWEEN '01-abr-2023' and SYSDATE
        AND ped.posicao LIKE 'F'
        AND ped.vlbonific = 0
    GROUP BY ped.codusur)
-----------------------------------------------------------------------------------------------------------------------
SELECT (usur.codusur || ' - ' || usur.nome) AS "Vendedor",
        fat.faturamento AS "Faturamento"
FROM PCUSUARI usur
    JOIN FaturamentoDocile fat ON usur.codusur = fat.RCA
WHERE usur.codusur IN (140,141,142,157,164,153,158,155,156,167,169,170,172,151)
-----------------------------------------------------------------------------------------------------------------------
