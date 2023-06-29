WITH Fat AS 
    (SELECT ped.codusur,
            SUM(ped.qt*ped.pvenda) + 0 as Fat
    FROM PCPEDI ped
        JOIN pcprodut prod on ped.codprod = prod.codprod
    WHERE prod.codfornec = 1634
        AND ped.data BETWEEN '01-jul-2023' and '31-jul-2023'
        AND ped.posicao NOT LIKE 'C'
        AND ped.vlbonific = 0
    Group By ped.codusur),
-----------------------------------------------------------------------------------------------------------------------
    DN AS
        (SELECT ped.codusur,
                COUNT(DISTINCT ped.codcli) + 0 AS DN
            FROM PCPEDC ped
                JOIN PCPEDI pedi on pedi.numped = ped.numped
                JOIN pcprodut prod on pedi.codprod = prod.codprod
            WHERE prod.codfornec = 1634
                AND ped.data BETWEEN '01-jul-2023' and '31-jul-2023'
                AND PED.DTCANCEL IS NULL
                AND PED.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
            GROUP BY ped.codusur)
-----------------------------------------------------------------------------------------------------------------------
             
SELECT  usur.codusur cod, usur.nome AS "Vendedor",
        f.fat AS "Faturamento",
        d.dn AS "DN DISTINTOS"
        
FROM PCUSUARI usur
        JOIN Fat f on usur.codusur = f.codusur
        JOIN DN d on usur.codusur = d.codusur

WHERE usur.codusur in (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174)

