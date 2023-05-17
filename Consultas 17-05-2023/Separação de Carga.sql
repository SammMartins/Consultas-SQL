SELECT a.codprod,
       b.Descricao,
       b.embalagem,
       a.qt || ' ' || b.unidade "Qtd."
 FROM PCPEDI a
    JOIN PCPRODUT b on a.codprod = b.codprod
--Select * From pcprodut
