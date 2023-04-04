select a.codusur,a.numped,a.codcli,a.codprod,b.descricao,TRUNC((a.qtcorte/a.qtant)*100,2) || '%' porcent,a.qtant,a.qtcorte
    from pccortefv a
    join pcprodut b on a.codprod = b.codprod
where a.dtcorte BETWEEN SYSDATE-1 AND SYSDATE+1
--and a.codusur in (156,169,172,174)

order by porcent asc
--select * from pcprodut
