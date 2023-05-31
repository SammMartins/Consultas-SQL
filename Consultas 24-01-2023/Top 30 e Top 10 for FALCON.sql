select * from 
    (select c.codusur Vendedor,
            a.codcli || ' - ' || a.cliente cliente, 
            sum(b.qt * b.pvenda) - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = a.codcli
                                        and mov.dtmov between '01-fev-2023' AND SYSDATE
                                        and mov.codoper = 'ED') venda
           
    from PCCLIENT a
    join pcpedi b on a.codcli = b.codcli
    join pcusuari c on a.codusur1 = c.codusur
    join pcpedc d on b.numped = d.numped
    join pcprodut e on b.codprod = e.codprod

    where b.data between '01-fev-2023' AND SYSDATE

    and c.bloqueio like 'N'
    and c.codusur in (140)

    and d.codcob Not Like 'BNFT' 
    and d.codcob Not Like 'BNF' 

    group by a.codcli, a.cliente, c.codusur

    order by venda desc)
where ROWNUM <= 10
