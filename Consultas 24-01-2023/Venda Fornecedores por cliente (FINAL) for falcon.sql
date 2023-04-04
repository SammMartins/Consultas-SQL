select cli.cliente, /*0*/ 
-------------------------------------------------------------------------------
/*1*/   nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and B.codfornec = 588
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 588
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) danone,
-------------------------------------------------------------------------------
/*2*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli 
        and A.data between '{DATAINI}' AND '{DATAFIN}'       
        and B.codfornec = 1321
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF')- (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1321
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) laticinios_prime_queijos, 
-------------------------------------------------------------------------------
/*3*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1225
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1225
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) empresa_brasileira_de_bebidas,
-------------------------------------------------------------------------------
/*4*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1627
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1627
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) docile_nordeste, 
-------------------------------------------------------------------------------
/*5*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1607
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1607
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) HYTS, 
-------------------------------------------------------------------------------
/*6*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1658
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1658
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) danilla, 
-------------------------------------------------------------------------------
/*7*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1541
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1541
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) seara, 
-------------------------------------------------------------------------------
/*8*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 98
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 98
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) avinor, 
-------------------------------------------------------------------------------
/*9*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1623
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1623
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) produtos_alimenticios_cefer, 
-------------------------------------------------------------------------------
/*10*/ nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1652
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1652
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) industria_e_comercio_azevedo, 
-------------------------------------------------------------------------------
/*11*/ nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1634
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1634
                                        and mov.dtmov between '{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) bivolt
-------------------------------------------------------------------------------

from Pcclient cli, pcpedi ped

where cli.codcli in ({CLIENTE})


group by cli.cliente, cli.codcli
