SELECT DISTINCT(a.codprod)|| ' - ' || b.descricao produto, 
        b.codfornec || ' - ' ||c.fornecedor fornecedor,
        
        a.  SITTRIBUT   ,
        a.  IVA ,
        a.  BASEICMS    ,
        a.  PERCICM ,
        a.  ALIQICMS1   ,
        a.  ALIQICMS2   ,
        a.  BASEICMSBCR ,
        a.  VLICMSBCR   ,
        a.  CODICMTAB   ,
        a.  QTSALDOEST  ,
        a.  CODST   ,
        a.  CUSTOREALSEMSTANT   ,
        a.  CUSTOREALSEMST  ,
        a.  CUSTOFINEST ,
        a.  PERCBASEREDST   ,
        a.  STBCR   ,
        a.  PERPIS  ,
        a.  VLCREDPIS   ,
        a.  VLPIS   ,
        a.  PERCBASERED ,
        a.  BASEBCR ,
        a.  PERCOFINS   ,
        a.  VLCREDCOFINS    ,
        a.  PVENDA1

FROM PCMOV a
    JOIN PCprodut b on a.codprod = b.codprod
    JOIN pcfornec c on b.codfornec = c.codfornec
    JOIN pcsecao d on b.codsec = d.codsec
WHERE DTMOV > '01-jan-2023'

--select * from pcmov WHERE DTMOV > '01-jan-2023'
