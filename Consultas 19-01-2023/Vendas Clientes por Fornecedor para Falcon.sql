select cli.cliente, /*0*/ 
-------------------------------------------------------------------------------
/*1*/   (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped
        --join pcmov mov on A.codcli = mov.codcli

        where a.codcli = cli.codcli
        and B.codfornec = 588
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        --and mov.codoper = 'ED'
        
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') danone,
-------------------------------------------------------------------------------
/*2*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli 
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'       
        and B.codfornec = 1321
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') laticinios_prime_queijos, 
-------------------------------------------------------------------------------
/*3*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1225
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') empresa_brasileira_de_bebidas,
-------------------------------------------------------------------------------
/*4*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1627
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') docile_nordeste, 
-------------------------------------------------------------------------------
/*5*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1607
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') rivelli_bezerra, 
-------------------------------------------------------------------------------
/*6*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1658
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') danilla_foods_brasil, 
-------------------------------------------------------------------------------
/*7*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1541
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') seara, 
-------------------------------------------------------------------------------
/*8*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 98
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') avinor, 
-------------------------------------------------------------------------------
/*9*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1623
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') produtos_alimenticios_cefer, 
-------------------------------------------------------------------------------
/*10*/ (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1652
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') industria_e_comercio_azevedo, 
-------------------------------------------------------------------------------
/*11*/ (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data between '01-jan-2023' and '18-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = 1634
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') bivolt
-------------------------------------------------------------------------------

from Pcclient cli, pcpedi ped

where cli.codcli in (1508,1507,8416,8976)--({CLIENTE)}


group by cli.cliente, cli.codcli

--select codoper from pcmov where dtmov between '01-jan-2023' and '18-jan-2023'
