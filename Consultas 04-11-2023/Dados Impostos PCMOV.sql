SELECT DISTINCT(a.codprod)|| ' - ' || b.descricao produto, 
        b.codfornec || ' - ' ||c.fornecedor fornecedor, 
        b.codsec || ' - ' || d.descricao seção
        ,a.ST,a.SITTRIBUT,a.baseicms,a.baseicst,a.codplpag,a.percipi,a.pericm,a.percst,a.vlbaseipi,a.vlipi,
        a.codfiscal,a.codst,a.perpis,a.VLCREDPIS,a.VLCREDICMS,a.CUSTOREALSEMST,a.IVA,a.ALIQICMS1,a.ALIQICMS2,
        a.CUSTOFINEST
FROM PCMOV a
    JOIN PCprodut b on a.codprod = b.codprod
    JOIN pcfornec c on b.codfornec = c.codfornec
    JOIN pcsecao d on b.codsec = d.codsec
WHERE DTMOV > '01-jan-2023'

--select * from pcsecao
