select cli.Codcli || ' - ' || cli.cliente Cliente, 
-------------------------------------------------------------------------------
/*1*/   (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where A.codcli = 8416--({CLIENTE)} --uma forma de fazer
        and A.data between '02-jan-2023' and '02-jan-2023' --'{DATAINI}' AND '{DATAFIN}' --uma forma de fazer
        and B.codfornec = 588
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') danone, 
-------------------------------------------------------------------------------
/*2*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli --Outra forma de fazer
        and A.data = ped.data       --Outra forma de fazer
        and B.codfornec = 1321
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') laticinios_prime_queijos, 
-------------------------------------------------------------------------------
/*3*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1225
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') empresa_brasileira_de_bebidas,
-------------------------------------------------------------------------------
/*4*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1627
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') docile_nordeste, 
-------------------------------------------------------------------------------
/*5*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1607
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') rivelli_bezerra, 
-------------------------------------------------------------------------------
/*6*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1658
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') danilla_foods_brasil, 
-------------------------------------------------------------------------------
/*7*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1541
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') seara, 
-------------------------------------------------------------------------------
/*8*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 98
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') avinor, 
-------------------------------------------------------------------------------
/*9*/  (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1623
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') produtos_alimenticios_cefer, 
-------------------------------------------------------------------------------
/*10*/ (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1652
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') industria_e_comercio_azevedo, 
-------------------------------------------------------------------------------
/*11*/ (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1634
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') bivolt, 
-------------------------------------------------------------------------------
/*12*/ (select sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where a.codcli = cli.codcli
        and A.data = ped.data
        and B.codfornec = 1488
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') fini
-------------------------------------------------------------------------------

from Pcclient cli, pcpedi ped

where cli.codcli = 8416--({CLIENTE)}
and ped.data between '02-jan-2023' and '02-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
