select sum(A.qt * A.pvenda) nomeFORNECEDOR
from pcpedi A

join pcprodut B on A.codprod = B.codprod
join pcpedc C on A.numped = C.numped

where A.codcli = 8416
and A.data between '02-jan-2023' and '02-jan-2023'

and B.codfornec in (588,1321,1225,1627,1607,1658,1541,98,1623,1652,1634,1488)
and C.codcob Not Like 'BNFT'
and C.codcob Not Like 'BNF'
