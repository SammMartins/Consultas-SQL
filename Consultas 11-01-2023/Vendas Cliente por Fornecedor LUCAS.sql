with aa
as 
(

select cli.Codcli, 
-------------------------------------------------------------------------------
case when   forn.codfornec =   588 then    'danone'
  when  forn.codfornec =   1321    then    'lat_prime_queijos'
   when forn.codfornec =   1225    then    'empr_br_de_bebidas'
  when  forn.codfornec =   1627    then    'docile_nordeste'
 when   forn.codfornec =   1607    then    'rivelli_bezerra'
 when   forn.codfornec =   1658    then    'danilla_foods_br'
 when   forn.codfornec =   1541    then    'seara'
 when   forn.codfornec =   98      then     'avinor'
 when   forn.codfornec =   1623    then    'prod_alim_cefer'
 when   forn.codfornec =   1652    then    'ind_e_comercio_azevedo'
 when   forn.codfornec =   1634    then    'bivolt'
 when   forn.codfornec =   1488    then    'fini'
       else
    'outro' end  fornecedor, 
   (select 
   
   sum(A.qt * A.pvenda)
        from pcpedi A

        join pcprodut B on A.codprod = B.codprod
        join pcpedc C on A.numped = C.numped

        where A.codcli = cli.codcli--({CLIENTE)}
        and A.data between '02-jan-2023' and '02-jan-2023' --'{DATAINI}' AND '{DATAFIN}'
        and B.codfornec = forn.codfornec
        and C.codcob Not Like 'BNFT'
        and C.codcob Not Like 'BNF') realizado


from Pcclient cli,
pcfornec forn

where 
forn.codfornec in  (
1488,
1634,
1652,
1623,
98,
1541,
1658,
1607,
1627,
1225,
1321,
588)
and
cli.codcli = 8416

group by 
 cli.Codcli, 
 forn.codfornec
)
select * from aa
pivot
(
sum(realizado)
for fornecedor in ('danone','empr_br_de_bebidas','docile_nordeste','rivelli_bezerra'
,'danilla_foods_br','seara', 'avinor','prod_alim_cefer','ind_e_comercio_azevedo','bivolt','fini','outro')
)
