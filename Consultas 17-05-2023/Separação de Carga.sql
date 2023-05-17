SELECT a.codprod,
       b.Descricao,
       b.qtunitcx,
       --(CASE WHEN (SUM(a.qt) / b.qtunitcx) >= 1 THEN (SUM(a.qt) / b.qtunitcx) || ' Caixas' Else SUM(a.qt) || ' Unidades' END) "Qtd. P/ Carga",
       b.PESOBRUTO * SUM(a.qt) PESOTOTAL
 FROM PCPEDI a
    JOIN PCPRODUT b on a.codprod = b.codprod
    JOIN PCPEDC c on a.numped = c.numped
 Where c.numcar = 193969
 GROUP BY a.codprod,b.Descricao, b.unidade,b.PESOBRUTO,a.QT,b.qtunitcx
--Select * From PCPRODUT WHERE codprod = 17462
