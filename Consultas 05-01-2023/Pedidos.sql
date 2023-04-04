select *--sum(a.qt * a.pvenda) venda
from pcpedi a --pcpedi --pcmov 
where a.data between '01-jan-2023' and '31-jan-2023'
