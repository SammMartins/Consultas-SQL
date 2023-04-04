select cli.cliente, /*0*/ 
-------------------------------------------------------------------------------
/*1*/   nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and B.codfornec = 588
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 588
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) danone,
-------------------------------------------------------------------------------
/*2*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli 
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'       
        and B.codfornec = 1321
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF')- (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1321
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) laticinios_prime_queijos, 
-------------------------------------------------------------------------------
/*3*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1225
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1225
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') empresa_brasileira_de_bebidas,
-------------------------------------------------------------------------------
/*4*/  nvl((select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1627
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1627
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED'),0) docile_nordeste, 
-------------------------------------------------------------------------------
/*5*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1607
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1607
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') rivelli_bezerra, 
-------------------------------------------------------------------------------
/*6*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1658
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1658
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') danilla_foods_brasil, 
-------------------------------------------------------------------------------
/*7*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1541
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1541
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') seara, 
-------------------------------------------------------------------------------
/*8*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 98
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 98
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') avinor, 
-------------------------------------------------------------------------------
/*9*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1623
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1623
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') produtos_alimenticios_cefer, 
-------------------------------------------------------------------------------
/*10*/ (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1652
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1652
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') industria_e_comercio_azevedo, 
-------------------------------------------------------------------------------
/*11*/ (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1634
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                        join pcprodut B on mov.codprod = B.codprod
                                        where mov.codcli = cli.codcli
                                        and B.codfornec = 1634
                                        and mov.dtmov between '01-jan-2023' and '23-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
                                        and mov.codoper = 'ED') bivolt
-------------------------------------------------------------------------------

from Pcclient cli, pcpedi ped

where cli.codcli in (1507)--(1508,,8416,8976)--({CLIENTE)}


group by cli.cliente, cli.codcli
