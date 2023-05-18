SELECT DISTINCT a.codprod,
       b.Descricao,
       SUM(a.qt) qt_ped,
       b.qtunitcx,
       (CASE WHEN (SUM(a.qt) / b.qtunitcx) >= 1 THEN TRUNC((SUM(a.qt) / b.qtunitcx),0)||' Caixas'||' e '||TRUNC(MOD(SUM(a.qt),b.qtunitcx))||' Unidades'
             Else '0 Caixas e '||SUM(a.qt) || ' Unidades' 
        END) "Qtd. Separação",
       b.PESOBRUTO * SUM(a.qt) AS PESOTOTAL
       
FROM PCPEDI a
    JOIN PCPRODUT b ON a.codprod = b.codprod
    JOIN PCPEDC c ON a.numped = c.numped

WHERE c.numcar = 193969

GROUP BY a.codprod, b.Descricao, b.qtunitcx, b.PESOBRUTO
--Select * From PCPRODUT WHERE codprod = 17462
