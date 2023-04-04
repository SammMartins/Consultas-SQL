select * from 
    (select c.codusur Vendedor,
            a.codcli || ' - ' || a.cliente cliente, 
           'R$' || ' ' || 
            sum(b.qt * b.pvenda) venda
           
    from PCCLIENT a
    join pcpedi b on a.codcli = b.codcli
    join pcusuari c on a.codusur1 = c.codusur

    where b.data between '01-jan-2023' and '31-jan-2023' --'{DATAINI}' AND '{DATAFIN}'

    and c.codsupervisor in (2,8,9) --({SUPERVISOR})
    and c.bloqueio like 'N'
   and c.nome like '%DANONE%'

    group by a.codcli, a.cliente, c.codusur

    order by venda desc)
where ROWNUM <= 30
