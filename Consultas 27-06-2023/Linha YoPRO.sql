Select DISTINCT m.codprod,p.descricao,TRUNC(SUM(M.QT)/24,0) QT,TRUNC(AVG(m.PUNIT),2) VALOR
from PCMOV M
JOIN PCPRODUT p on m.codprod = p.codprod
WHERE M.codprod IN (17883, 17884, 17885, 18173)
AND M.DTMOV BETWEEN '01-jun-2023' AND SYSDATE
AND m.codoper NOT LIKE 'ED'
AND m.PUNIT < 6.90
GROUP BY  m.codprod,p.descricao
