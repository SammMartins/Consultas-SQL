SELECT DISTINCT vend.nome,
GREATEST((trunc(((SUM(mov.QT*mov.PUNIT)*100)/NVL(meta.vlvendaprev,1)/*META*/),0))-100,0) Pontuação_F,
----------------------------------------------------------------------------------------------------------------
GREATEST((SELECT NVL(SUM(MET.CLIPOSPREV),0.001)
    FROM PCMETA MET
    WHERE MET.data BETWEEN '01-FEV-2023' and '30-ABR-2023'
    AND MET.CODIGO = 1658
    AND MET.CODUSUR = vend.CODUSUR)-100,0) porcentagem_P,
----------------------------------------------------------------------------------------------------------------
GREATEST((SELECT NVL(SUM(MET.CLIPOSPREV),0.001)
    FROM PCMETA MET
    WHERE MET.data BETWEEN '01-FEV-2023' and '30-ABR-2023'
    AND MET.CODIGO = 1658
    AND MET.CODUSUR = vend.CODUSUR)-100,0) +
GREATEST((trunc(((SUM(mov.QT*mov.PUNIT)*100)/NVL(meta.vlvendaprev,1)/*META*/),0))-100,0) total
----------------------------------------------------------------------------------------------------------------

                

from pcmov mov
join pcusuari vend on mov.codusur = vend.codusur
JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
join PCMETA meta on mov.codusur = meta.codusur

WHERE mov.dtmov BETWEEN '01-fev-2023' and '30-abr-2023'
and meta.data BETWEEN '01-fev-2023' and '30-abr-2023'
AND mov.codoper = 'S' --Vendas normais efetivadas 'S' --Bonificação 'SB'
and prod.codfornec = 1658 --Danilla Foods
and meta.codigo in (120424,1658)
AND mov.codoper = 'S'
and meta.tipometa like 'F'
and vend.codusur not in (149,160,143)
and vend.codsupervisor in (2,8,9)--({SUPERVISOR})

group by meta.vlvendaprev,vend.nome,vend.CODUSUR,mov.codusur,mov.dtmov
ORDER BY Total desc
