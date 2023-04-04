SELECT vend.nome,
       meta.vlvendaprev FATURAMENTO_meta,
       SUM(mov.QT*mov.PUNIT) faturamento,
       (SUM(mov.QT*mov.PUNIT))-(meta.vlvendaprev) GAP,
       (trunc(((SUM(mov.QT*mov.PUNIT)*100)/NVL(meta.vlvendaprev,1)/*META*/),0)) || '%' porcentagem_F
       


       
from pcmov mov
join pcusuari vend on mov.codusur = vend.codusur
JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
join PCMETA meta on mov.codusur = meta.codusur

WHERE mov.dtmov BETWEEN '01-fev-2023' and '30-abr-2023'
and meta.data BETWEEN '01-fev-2023' and '30-abr-2023'
AND mov.codoper = 'S' --Vendas normais efetivadas 'S' --Bonificação 'SB'
and prod.codfornec = 1658 --Danilla Foods
and meta.codigo in (120424,1658)
and meta.tipometa like 'S'
and vend.codusur not in (2,149,160,143)
and vend.codsupervisor in (2,8,9)--({SUPERVISOR})



group by mov.codusur,meta.vlvendaprev,meta.cliposprev,vend.nome
ORDER BY vend.nome asc
