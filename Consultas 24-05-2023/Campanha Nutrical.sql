SELECT * FROM

    (WITH DN AS 
        (SELECT ped.codusur AS RCA,
           COUNT(DISTINCT ped.codcli) AS DISTINTOS
        FROM PCPEDC ped
            JOIN PCPEDI pedi on pedi.numped = ped.numped
            JOIN pcprodut prod on pedi.codprod = prod.codprod
        WHERE prod.codfornec = 1761
            AND ped.data BETWEEN '15-mai-2023' and '15-jun-2023'
            AND PED.DTCANCEL IS NULL
            AND PED.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
        GROUP BY ped.codusur)
----------------------------------------------------------------------------------------------------------------------------    
    SELECT  usur.codusur "COD", usur.nome AS "Vendedor", dist.distintos AS "DN DISTINTOS"        
    FROM PCUSUARI usur
        JOIN DN dist ON usur.codusur = dist.RCA
    WHERE usur.codusur IN (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174)

----------------------------------------------------------------------------------------------------------------------------    
    UNION all
    SELECT NULL as "COD",
           'TOTAL DE POSITIVAÇÕES' as "Vendedor",
           SUM(a.distintos) AS "DN DISTINTOS"
    FROM DN a
    
)
ORDER BY
CASE WHEN "COD" IS NULL THEN 1 ELSE 0 END,
"DN DISTINTOS" DESC
