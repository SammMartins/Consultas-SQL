SELECT ped.codprod,sum(ped.qt) as "Tot. Qt. Ped.", (b.qtest - b.qtreserv) "QT. Estoque"
    FROM PCPEDI ped
        JOIN pcprodut prod on ped.codprod = prod.codprod
        JOIN PCest b on prod.codprod = b.codprod
    WHERE ped.codprod = 17443
        AND ped.data BETWEEN SYSDATE-5 and SYSDATE
        AND ped.posicao NOT LIKE 'C'
        AND ped.vlbonific = 0
        and b.codfilial = 3
    GROUP BY ped.codprod,b.qtest,b.qtreserv
        
