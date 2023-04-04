--Rancking de fornecedores por Cliente
select a.codfornec || ' ' || a.fornecedor Fornecedor,
    (select SUM(b1.qt * b1.pvenda) 
        from PcPedi b1 
        join PcProdut b2 on b2.codprod = b1.codprod 
        join PcClient b3 on b3.codcli = b1.codcli
        where b3.Codcli = 8416) VENDA



from Pcfornec a
join PcClient b3 on b3.codcli = b3.codcli
where b3.Codcli = 8416
--join pcprodut b on a.codfornec = b.codfornec
