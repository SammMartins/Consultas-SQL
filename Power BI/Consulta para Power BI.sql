SELECT
ped.codusur,
usur.codsupervisor,
ped.codcli,
cli.cliente,
ped.codprod,
prod.descricao,
ped.numped,
prod.codfornec,
prod.codsec,
ped.qt,
ped.pvenda,
ped.ptabela,
CASE WHEN ped.vlbonific = 0 OR ped.vlbonific IS NULL THEN 'VENDA' ELSE 'BNF' END tipovenda,
ped.posicao
from pcpedi ped
join pcprodut prod on ped.codprod = prod.codprod
join pcusuari usur on ped.codusur = usur.codusur
join pcclient cli on ped.codcli = cli.codcli
WHERE ped.data BETWEEN '01-jun-2023' AND '30-jun-2023'
