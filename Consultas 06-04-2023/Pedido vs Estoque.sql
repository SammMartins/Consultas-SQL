SELECT Distinct a.CODPROD, c.descricao, SUM(a.QT) qt_ped, b.qtest qt_est
from pcpedi a
JOIN PCest b on a.codprod = b.codprod
join pcprodut c on a.codprod = c.codprod
WHERE a.DATA > '02-abr-2023'
AND a.CODUSUR Not In (140,141,142,143,153,164,157,2,10)
AND a.posicao != 'F'
AND (a.QT - b.qtest) < 0
--AND c.descricao like '%YOPRO%'
group by a.codprod,c.descricao,b.qtest