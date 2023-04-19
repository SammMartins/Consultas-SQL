select a.codusur || ' - ' || c.nome RCA,
       a.numped,a.codcli,a.codprod,b.descricao,TRUNC((a.qtcorte/a.qtant)*100,2) || '%' porcent,a.qtant,a.qtcorte
    from pccortefv a
    join pcprodut b on a.codprod = b.codprod
    join pcusuari c on a.codusur = c.codusur
where a.dtcorte > SYSDATE-1
    --and b.codfornec = 1541
    --and a.codusur not in (155,156,172,167,170,169)
    --and a.codprod in (17474,17464,17467,17948,17950,17855)

order by porcent asc

