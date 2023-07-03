SELECT
usur.codsupervisor,
cli.codusur1,
cli.codcli,
cli.cliente,
cli.ENDERENT,
cli.BAIRROENT,
cli.municent
from pcclient cli
join pcusuari usur on cli.codusur1 = usur.codusur

WHERE cli.dtultcomp > SYSDATE-90

--select * from pcclient

