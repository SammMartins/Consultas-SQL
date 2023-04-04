SELECT mov.codusur RCA, 
       COUNT(DISTINCT mov.codcli) positivado, 
       trunc(((COUNT(DISTINCT mov.codcli)*100)/50/*META*/),0) || '%' porcentagem_P,
       GREATEST(trunc(((COUNT(DISTINCT mov.codcli)*100)/50/*META*/)-100,0),0) pontos_P,
       SUM(mov.QT*mov.PUNIT) faturamento,
       trunc(((SUM(mov.QT*mov.PUNIT)*100)/meta.vlvendaprev/*META*/),0) || '%' porcentagem_F,
       GREATEST(trunc(((SUM(mov.QT*mov.PUNIT)*100)/meta.vlvendaprev/*META*/)-100,0),0) pontos_F,
       (GREATEST(trunc(((COUNT(DISTINCT mov.codcli)*100)/50/*META*/)-100,0),0)) + (GREATEST(trunc(((SUM(mov.QT*mov.PUNIT)*100)/meta.vlvendaprev/*META*/)-100,0),0)) total

       
from pcmov mov
LEFT JOIN pcusuari rca on mov.codusur = rca.codusur
JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
join PCMETA meta on mov.codusur = meta.codusur

WHERE mov.dtmov BETWEEN '01-fev-2023' and '30-abr-2023'
AND mov.codoper = 'S' --Vendas normais efetivadas 'S' --Bonificação 'SB'
and MOV.CODUSUR not like 10 and MOV.CODUSUR not like 149
and prod.codfornec = 1658 --Danilla Foods


group by meta.codusur,mov.codusur,meta.vlvendaprev


       
