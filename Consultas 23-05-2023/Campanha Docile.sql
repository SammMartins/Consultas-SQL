WITH FaturamentoDocile AS 
    (SELECT ped.codusur as RCA,
            SUM(ped.qt*ped.pvenda) + 0 as Faturamento
    FROM PCPEDI ped
        JOIN pcprodut prod on ped.codprod = prod.codprod
    WHERE prod.codfornec = 1627
        AND ped.data BETWEEN '01-may-2023' and SYSDATE
        AND ped.posicao NOT LIKE 'C'
        AND ped.vlbonific = 0
    Group By ped.codusur),
-----------------------------------------------------------------------------------------------------------------------
    DNMAIO AS
        (SELECT ped.codusur AS RCA,
                COUNT(DISTINCT ped.codcli) + 0 AS DNMAIO 
            FROM PCPEDC ped
                JOIN PCPEDI pedi on pedi.numped = ped.numped
                JOIN pcprodut prod on pedi.codprod = prod.codprod
            WHERE prod.codfornec = 1627
                AND ped.data BETWEEN '01-may-2023' and '31-may-2023'
                AND PED.DTCANCEL IS NULL
                AND PED.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
            GROUP BY ped.codusur),
   -------------------------------------------------------------------------- 
    DNJUNHO AS 
        (SELECT ped.codusur AS RCA,
                COUNT(DISTINCT ped.codcli) + 0 AS DNJUNHO
            FROM PCPEDC ped
                JOIN PCPEDI pedi on pedi.numped = ped.numped
                JOIN pcprodut prod on pedi.codprod = prod.codprod
            WHERE prod.codfornec = 1627
                AND ped.data BETWEEN '01-jun-2023' and '30-jun-2023'
                AND PED.DTCANCEL IS NULL
                AND PED.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
            GROUP BY ped.codusur),
-----------------------------------------------------------------------------------------------------------------------
DNDISTINCT AS
    (SELECT ped.codusur AS RCA,
            COUNT(DISTINCT ped.codcli) + 0 AS DISTINTOS --Maio e Junho
    FROM PCPEDC ped
        JOIN PCPEDI pedi on pedi.numped = ped.numped
        JOIN pcprodut prod on pedi.codprod = prod.codprod
    WHERE prod.codfornec = 1627
        AND ped.data BETWEEN '01-may-2023' and SYSDATE
        AND PED.DTCANCEL IS NULL
        AND PED.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
    GROUP BY ped.codusur)
-----------------------------------------------------------------------------------------------------------------------
SELECT  usur.codusur cod, usur.nome AS "Vendedor",
        fat.faturamento AS "Faturamento",
        dist.distintos AS "DN DISTINTOS",
        maio.dnmaio + jun.dnjunho
        AS "SOMA DN"
        
FROM PCUSUARI usur
    JOIN FaturamentoDocile fat ON usur.codusur = fat.RCA
    JOIN DNDISTINCT dist ON usur.codusur = dist.RCA
    JOIN DNMAIO maio ON usur.codusur = maio.RCA
    JOIN DNJUNHO jun ON usur.codusur = jun.RCA
WHERE usur.codusur IN (140, 141, 142, 143, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 169, 170, 172)
ORDER BY cod
