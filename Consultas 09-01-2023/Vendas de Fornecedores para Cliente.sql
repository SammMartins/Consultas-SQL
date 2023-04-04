select sum(A.qt * A.pvenda)
from pcpedi A
join pcprodut B on B.codprod = A.codprod

where A.codcli = 8416
and A.data between '02-jan-2023' and '02-jan-2023'
and A.codusur = 140

