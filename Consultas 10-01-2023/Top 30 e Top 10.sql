select * from 
    (select c.codusur Vendedor,
            a.codcli || ' - ' || a.cliente cliente, 
            sum(b.qt * b.pvenda) venda
           
    from PCCLIENT a
    join pcpedi b on a.codcli = b.codcli
    join pcusuari c on a.codusur1 = c.codusur
    join pcpedc d on b.numped = d.numped
    join pcprodut e on b.codprod = e.codprod

    where b.data between '02-jan-2023' and '02-jan-2023' --'{DATAINI}' AND '{DATAFIN}'

    and c.codsupervisor in (2,8,9) --({SUPERVISOR})
    and c.bloqueio like 'N'
    and c.nome like '%DANONE%'
    and c.codusur in (140,141,142,145,148,149,150,151,152,153,155,156,157,158,160,164,167,168,169,170,172,174) --({VENDEDOR})

    and d.codcob Not Like 'BNFT' 
    and d.codcob Not Like 'BNF' 

    group by a.codcli, a.cliente, c.codusur

    order by venda desc)
where ROWNUM <= 30--{CHECKBOX}
