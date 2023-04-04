select *--a.codcli, a.cliente
from PCCLIENT a --pcpedi --pcmov 
where a.dtcadastro between '01-jan-2022' and '31-jan-2023'
--inner join pcmov b on a.codcli = b.codcli
