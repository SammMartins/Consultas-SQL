select 
a.codusur,
b.nome vendedor,
a.codcli, 
sum (a.qt * a.pvenda) venda
from pcpedi a 
join pcusuari b on a.codusur = b.codusur
where
a.data between '01-jan-2023' and '31-jan-2023'

group by 
a.codusur,
a.codcli,
b.nome


order by venda desc

