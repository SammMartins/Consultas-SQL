SELECT a.codprod,
       b.Descricao,
       --b.embalagem,
       a.qt || ' ' || b.unidade "Qtd.",
       b.PESOBRUTO * a.QT PESOTOTAL,
        b.qtunitcx
 FROM PCPEDI a
    JOIN PCPRODUT b on a.codprod = b.codprod
    JOIN PCPEDC c on a.numped = c.numped
 Where c.numcar = 193969
--Select * From PCPRODUT WHERE codprod = 17462
