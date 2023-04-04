Select rca.nome,
------------------------------------------------------------------------------------------------------------------
(SELECT GREATEST((trunc(((SUM(mov.QT*mov.PUNIT)*100)/NVL(meta.vlvendaprev,1)/*META*/),0))-100,0) Pontos_F 
from pcmov mov
join pcusuari vend on mov.codusur = vend.codusur
JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
join PCMETA meta on mov.codusur = meta.codusur
WHERE mov.dtmov BETWEEN '30-jan-2023' and '30-abr-2023'
and meta.data = '01-fev-2023'
AND mov.codoper = 'S' --Vendas normais efetivadas 'S' --Bonificação 'SB'
and prod.codfornec = 1658 --Danilla Foods
and meta.codigo in (120424,1658)
and meta.tipometa like 'S'
and vend.codusur = rca.codusur
GROUP BY meta.vlvendaprev) Pontos_F,
------------------------------------------------------------------------------------------------------------------
(select GREATEST((trunc((count(distinct b.codcli)*100)/NVL(METa.CLIPOSPREV,1),0))-100,0) Pontos_P
        from pcmov b 
        join pcusuari c on b.codusur = c.codusur
        join pcprodut d on b.codprod = d.codprod
        join PCMETA meta on b.codusur = meta.codusur
        where b.codusur = rca.CODUSUR
        and b.codfornec = 1658 and meta.CODIGO = 1658
        AND B.CODOPER = 'S'
        and b.dtmov between '01-FEV-2023' and '30-ABR-2023' 
        and meta.data = '01-fev-2023'
        group by c.nome,METa.CLIPOSPREV) Pontos_P,
------------------------------------------------------------------------------------------------------------------
SUM((SELECT COUNT(COUNT (DISTINCT(A.CODPROD)))
    FROM PCPEDI A 
    JOIN PCPRODUT C ON A.CODPROD = C.CODPROD
    WHERE A.DATA BETWEEN '30-JAN-2023' AND '30-abr-2023'
    AND C.CODFORNEC = 1658
    AND A.CODUSUR = rca.CODUSUR
    and A.posicao like 'F'
    GROUP BY A.CODCLI, A.CODPROD
)) Pontos_sku,
------------------------------------------------------------------------------------------------------------------
(Select SUM((TRUNC(ped.qt/pro.qtunitcx,0))*10)
    from pcpedi ped, pcprodut pro
    where CODFORNEC = 1658
    and ped.CODPROD = pro.CODPROD
    and ped.posicao like 'F'
    and ped.codusur = rca.codusur
    --and ped.qt <> ped.qtseparada
    and DATA BETWEEN '30-JAN-2023' AND '30-abr-2023') Pontos_CX,
------------------------------------------------------------------------------------------------------------------
((SELECT GREATEST((trunc(((SUM(mov.QT*mov.PUNIT)*100)/NVL(meta.vlvendaprev,1)/*META*/),0))-100,0) Pontos_F 
from pcmov mov
join pcusuari vend on mov.codusur = vend.codusur
JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
join PCMETA meta on mov.codusur = meta.codusur
WHERE mov.dtmov BETWEEN '30-jan-2023' and '30-abr-2023'
and meta.data = '01-fev-2023'
AND mov.codoper = 'S' --Vendas normais efetivadas 'S' --Bonificação 'SB'
and prod.codfornec = 1658 --Danilla Foods
and meta.codigo in (120424,1658)
and meta.tipometa like 'S'
and vend.codusur = rca.codusur
GROUP BY meta.vlvendaprev) + 
(select GREATEST((trunc((count(distinct b.codcli)*100)/NVL(METa.CLIPOSPREV,1),0))-100,0) Pontos_P
        from pcmov b 
        join pcusuari c on b.codusur = c.codusur
        join pcprodut d on b.codprod = d.codprod
        join PCMETA meta on b.codusur = meta.codusur
        where b.codusur = rca.CODUSUR
        and b.codfornec = 1658 and meta.CODIGO = 1658
        AND B.CODOPER = 'S'
        and b.dtmov between '01-FEV-2023' and '30-ABR-2023' 
        and meta.data = '01-fev-2023'
        group by c.nome,METa.CLIPOSPREV) +
SUM((SELECT COUNT(COUNT (DISTINCT(A.CODPROD)))
    FROM PCPEDI A 
    JOIN PCPRODUT C ON A.CODPROD = C.CODPROD
    WHERE A.DATA BETWEEN '30-JAN-2023' AND '30-abr-2023'
    AND C.CODFORNEC = 1658
    AND A.CODUSUR = rca.CODUSUR
    and A.posicao like 'F'
    GROUP BY A.CODCLI, A.CODPROD
)) + 
(Select SUM((TRUNC(ped.qt/pro.qtunitcx,0))*10)
    from pcpedi ped, pcprodut pro
    where CODFORNEC = 1658
    and ped.CODPROD = pro.CODPROD
    and ped.posicao like 'F'
    and ped.codusur = rca.codusur
    --and ped.qt <> ped.qtseparada
    and DATA BETWEEN '30-JAN-2023' AND '30-abr-2023')) total
------------------------------------------------------------------------------------------------------------------
from pcusuari rca
Where rca.codsupervisor in (2,8,9)--({SUPERVISOR})
and rca.codusur not in (2,139,149,160,143,144)
and rca.nome like 'DANONE%'

group by rca.nome,rca.codusur

order by TOTAL desc
