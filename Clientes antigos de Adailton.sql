select DISTINCT cli.codcli, cli.cliente,cli.fantasia, cli.dtultcomp,cli.municcob, cli.endercob, cli.bairrocob, cli.telcob,cli.codusur1
from pcclient cli
join pcpedi ped on cli.codcli = ped.codcli
join pcprodut prod on ped.codprod = prod.codprod
where cli.codusur1 in (140,141,142,157,164,153)
and dtultcomp < '01-fev-2023' and dtultcomp > '01-nov-2022'
--and prod.codfornec = 1658

--select * from pcclient
