select cli.cliente, /*0*/ 
-------------------------------------------------------------------------------
/*1*/   (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and B.codfornec = 588
        and A.data between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 588
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') danone

from Pcclient cli, pcpedi ped

where cli.codcli in (1508,1507,8416,8976)--({CLIENTE)}


group by cli.cliente, cli.codcli
