SELECT mov.codusur RCA, 
       COUNT(DISTINCT mov.codcli) positivado, 
       (select case when ((COUNT(DISTINCT mov.codcli))-10) < 0 then 0 else ((COUNT(DISTINCT mov.codcli))-10) from pcmov)
       
from pcmov mov
LEFT JOIN pcusuari rca on mov.codusur = rca.codusur
JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD

WHERE mov.dtmov BETWEEN '01-jan-2023' and '31-jan-2023'
AND mov.codoper = 'S' --Vendas normais efetivadas 'S' --Bonificação 'SB'

group by mov.codusur, 
       mov.codoper, 
       mov.dtmov,
       mov.codprod
