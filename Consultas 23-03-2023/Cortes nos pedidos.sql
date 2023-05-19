select a.codusur || ' - ' || c.nome RCA,
       a.numped,a.codcli,a.codprod,b.codfornec,b.descricao,TRUNC((a.qtcorte/a.qtant)*100,2) || '%' "%",a.qtant "Qt. Pedido",a.qtcorte "Qt. Corte"
    from pccortefv a
    join pcprodut b on a.codprod = b.codprod
    join pcusuari c on a.codusur = c.codusur
where a.dtcorte > SYSDATE-1
    --and b.codfornec = 1541
    --and a.codusur in (141,140,142,153,164,157,2)
    --and a.codprod in (17474,17464,17467,17948,17950,17855)

order by b.codfornec desc, "Qt. Corte" desc

