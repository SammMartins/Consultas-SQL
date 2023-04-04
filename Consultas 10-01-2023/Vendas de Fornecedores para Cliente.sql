select sum(A.qt * A.pvenda) venda
from pcpedi A
join pcprodut B on A.codprod = B.codprod
join pcpedc C on A.numped = C.numped

where A.codcli = 8416
and A.data between '02-jan-2023' and '02-jan-2023'
and A.codusur = 140

and B.codfornec = 1225

and C.codcob Not Like 'BNFT'
and C.codcob Not Like 'BNF'
