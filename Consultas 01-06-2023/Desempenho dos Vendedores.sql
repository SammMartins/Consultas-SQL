WITH FaturamentoDocile AS 
    (SELECT ped.codusur as RCA,
            SUM(ped.qt*ped.pvenda) as Faturamento
    FROM PCPEDI ped
        JOIN pcprodut prod on ped.codprod = prod.codprod
    WHERE prod.codfornec = 1658
        AND ped.data BETWEEN '01-jan-2023' and '31-mar-2023'
        AND ped.posicao NOT LIKE 'C'
        AND ped.vlbonific = 0
    Group By ped.codusur),
-----------------------------------------------------------------------------------------------------------------------
    DN AS    
        (SELECT ped.codusur AS RCA,
                COUNT(DISTINCT ped.codcli) AS distintos
            FROM PCPEDC ped
                JOIN PCPEDI pedi on pedi.numped = ped.numped
                JOIN pcprodut prod on pedi.codprod = prod.codprod
            WHERE prod.codfornec = 1658
                AND ped.data BETWEEN '01-jan-2023' and '31-mar-2023'
                AND PED.DTCANCEL IS NULL
                AND PED.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
            GROUP BY ped.codusur),
-----------------------------------------------------------------------------------------------------------------------
    CARTEIRA AS    
        (SELECT ped.codusur AS RCA,
                COUNT(DISTINCT ped.codcli) AS distintos
            FROM PCPEDC ped
                JOIN PCPEDI pedi on pedi.numped = ped.numped
                JOIN pcprodut prod on pedi.codprod = prod.codprod
            WHERE ped.data BETWEEN '01-jan-2023' and '31-mar-2023'
                AND PED.DTCANCEL IS NULL
                AND PED.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
            GROUP BY ped.codusur)
-----------------------------------------------------------------------------------------------------------------------

SELECT  usur.codusur cod, usur.nome AS "Vendedor",
        cart.distintos AS "Carteira",
        dist.distintos AS "DN DISTINTOS",
        fat.faturamento AS "Faturamento"
        
FROM PCUSUARI usur
    JOIN FaturamentoDocile fat ON usur.codusur = fat.RCA
    JOIN DN dist ON usur.codusur = dist.RCA
    JOIN CARTEIRA CART ON usur.codusur = cart.RCA

WHERE usur.codusur IN (140, 141, 142, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 164, 167, 168, 169, 170, 172, 174)
ORDER BY cod
