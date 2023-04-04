Select rca.codsupervisor,rca.codusur || ' ' ||rca.nome RCA,
------------------------------------------------------------------------------------------------------------------
(select sum(vlvendaprev) from pcmeta 
    where codigo in (10050,120387,1023,6004,
                        10001,1005,10041,10043)
        and data = '1-mar-2023' 
        and codusur = rca.codusur) SomaMetaF,
------------------------------------------------------------------------------------------------------------------
--Atingir meta Sell-out Mar./Abr. de R$ 190.000,00
(SELECT SUM(mov.QT*mov.PUNIT)
    from pcmov mov
        JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
    WHERE mov.dtmov BETWEEN '01-mar-2023' and '31-mar-2023'
        and mov.codusur = rca.codusur
        AND mov.codoper = 'S'
        and prod.codfornec in (1321,1225,1623,1634,1541,1607,1728,1727)) 
                                - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                            join pcprodut B on mov.codprod = B.codprod
                                        where mov.codusur = rca.codusur
                                            and mov.dtmov between '01-mar-2023' and '31-mar-2023'
                                            and mov.codoper = 'ED') SomaFaturado,
------------------------------------------------------------------------------------------------------------------
(SELECT SUM(mov.QT*mov.PUNIT) faturamento 
    from pcmov mov
        JOIN PCPRODUT prod ON mov.CODPROD = prod.CODPROD
    WHERE mov.dtmov BETWEEN '01-mar-2023' and '31-mar-2023'
        and mov.codusur = rca.codusur
        AND mov.codoper = 'S'
        and prod.codfornec in (1321,1225,1623,1634,1541,1607,1728,1727)) 
                                - (select nvl(sum(mov.qt * mov.punit),0)
                                        from pcmov mov
                                            join pcprodut B on mov.codprod = B.codprod
                                        where mov.codusur = rca.codusur
                                            and mov.dtmov between '01-mar-2023' and '31-mar-2023'
                                            and mov.codoper = 'ED')-(select sum(vlvendaprev) from pcmeta 
                                                                        where codigo in (10050,120387,1023,6004,
                                                                                            10001,1005,10041,10043)
                                                                            and data = '1-mar-2023' 
                                                                            and codusur = rca.codusur)  GAP_f,
------------------------------------------------------------------------------------------------------------------
(select sum(cliposprev) from pcmeta 
    where codigo in (1321,1225,1623,1634,1541,1607,1728,1727)
        and data = '1-mar-2023'
        and codusur = rca.codusur) SomaMetaP,
------------------------------------------------------------------------------------------------------------------
--1.600 positivações somando os 2 meses
(select count(distinct b.codcli)
    from pcmov b 
        join pcprodut d on b.codprod = d.codprod
    where b.codfornec in (1321,1225,1623,1634,1541,1607,1728,1727)
        AND B.CODOPER = 'S'
        and b.codusur = rca.codusur
        and b.dtmov between '01-mar-2023' and '31-mar-2023') SomaPositivado,
------------------------------------------------------------------------------------------------------------------
(select count(distinct b.codcli)
         from pcmov b 
           join pcprodut d on b.codprod = d.codprod
           where b.codfornec in (1321,1225,1623,1634,1541,1607,1728,1727)
                AND B.CODOPER = 'S'
                and b.codusur = rca.codusur
                and b.dtmov between '01-mar-2023' and '31-mar-2023')-(select sum(cliposprev) from pcmeta 
                                                                        where codigo in (1321,1225,1623,1634,1541,1607,1728,1727)
                                                                            and data = '1-mar-2023'
                                                                            and codusur = rca.codusur) gap_P
------------------------------------------------------------------------------------------------------------------
from pcusuari rca

Where rca.DTULTVENDA > '01-mar-2023'
    and rca.codsupervisor in (2,8,9) 
    and rca.codusur not in (2,149,160)

order by rca


--select * from pcmeta where codigo in (120423,1627) and data = '1-mar-2023'

--EMPRESAS: 1321 SULMINAS 10050  - 1225 DAFRUTA 120387  - 1623 SANTA MASSA 1023  - 1634 BIVOLT 6004 -  1541 MASSA LEVE 10001  - 1607 HITS 1005  - 1728 FRUTAP 10041 - 1727 FLORESTAL 10043

                                                                                                                
                                                                            




