SELECT
ped.codusur,
usur.codsupervisor,
ped.codprod,
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
WHERE ped.data > SYSDATE-90

--select * from pcprodut
--select * from pcpedi