select a.codusur,
a.nome vendedor,
(
SELECT 
NVL(SUM(MET.CLIPOSPREV),0)
FROM PCMETA MET
WHERE
MET.data BETWEEN '01-FEV-2023' and '30-ABR-2023'
AND
MET.CODIGO = 1658
AND
MET.CODUSUR = A.CODUSUR) META,

(select 
count(distinct b.codcli)
from pcmov b 
join pcusuari c on b.codusur = c.codusur
join pcprodut d on b.codprod = d.codprod
where
c.codusur = a.codusur
and
b.codfornec =1658
AND
B.CODOPER = 'S'
and
b.dtmov between '01-FEV-2023' and '30-ABR-2023') positivado,

(select 
count(distinct b.codcli)
from pcmov b 
join pcusuari c on b.codusur = c.codusur
join pcprodut d on b.codprod = d.codprod
where
c.codusur = a.codusur
and
b.codfornec =1658
AND
B.CODOPER = 'S'
and
b.dtmov between '01-FEV-2023' and '30-ABR-2023')-(SELECT 
NVL(SUM(MET.CLIPOSPREV),0)
FROM PCMETA MET
WHERE
MET.data BETWEEN '01-FEV-2023' and '30-ABR-2023'
AND
MET.CODIGO = 1658
AND
MET.CODUSUR = A.CODUSUR) GAP,

(select 
count(distinct b.codcli)
from pcmov b 
join pcusuari c on b.codusur = c.codusur
join pcprodut d on b.codprod = d.codprod
where
c.codusur = a.codusur
and
b.codfornec =1658
and
b.dtmov between '01-FEV-2023' and '30-ABR-2023') /
(
SELECT 
NVL(SUM(MET.CLIPOSPREV),0.001)
FROM PCMETA MET
WHERE
MET.data BETWEEN '01-FEV-2023' and '30-ABR-2023'
AND
MET.CODIGO = 1658
AND
MET.CODUSUR = A.CODUSUR) PERCENTUAL

from pcusuari a
where
a.CODSUPERVISOR IN (2,8,9)--({SUPERVISOR})
 and a.codusur not in (2,149,160,143)
and
a.bloqueio =   'N'
AND
A.DTTERMINO IS NULL

ORDER BY A.NOME
