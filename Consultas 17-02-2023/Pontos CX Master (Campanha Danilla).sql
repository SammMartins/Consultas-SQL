(Select SUM((TRUNC(ped.qt/pro.qtunitcx,0))*10) Pontos_CX
    from pcpedi ped, pcprodut pro
    where CODFORNEC = 1658
    and ped.CODPROD = pro.CODPROD
    and ped.posicao like 'F'
    --and ped.codusur = 174
    --and ped.qt <> ped.qtseparada
    and DATA BETWEEN '30-JAN-2023' AND '30-abr-2023')
