SELECT mov.codusur RCA, 
       COUNT(DISTINCT mov.codcli) positivado,
       meta.cliposprev DN_meta,
       trunc(((COUNT(DISTINCT mov.codcli)*100)/NVL(meta.cliposprev,1)/*META*/),0) || '%' porcentagem_P,
       
       'R$'|| SUM(mov.QT*mov.PUNIT) faturamento,
       'R$'|| meta.vlvendaprev FATURAMENTO_meta,
       (trunc(((SUM(mov.QT*mov.PUNIT)*100)/NVL(meta.vlvendaprev,1)/*META*/),0)) || '%' porcentagem_F

       
from pcmov mov
join pcusuari vend on mov.codusur = vend.codusur
JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
join PCMETA meta on mov.codusur = meta.codusur

WHERE mov.dtmov BETWEEN '01-fev-2023' and '30-abr-2023'
and meta.data = '01-fev-2023' 
AND mov.codoper = 'S' --Vendas normais efetivadas 'S' --Bonificação 'SB'
and prod.codfornec = 1658 --Danilla Foods
and meta.codigo = 120424
and vend.codusur in (140,141,142,157,164,153,158,155,156,167,169,170,172,148,145,150,151,152,168,174)
and vend.codsupervisor in (2,8,9)



group by mov.codusur,meta.vlvendaprev,meta.cliposprev


       
