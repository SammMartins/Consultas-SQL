SELECT SUM(round(a.valor + ((a.valor * 0.00333) * round(SYSDATE-a.dtvenc,0)), 2)) total
FROM pcprest a
WHERE a.dtvenc between '01-jan-2020' and SYSDATE
and a.codcob in ('7563','SERA','C','CHD1')
and a.vpago is NULL
and a.codusur in (140,141,142,145,148,149,150,151,152,153,155,156,
                    157,158,160,164,167,168,169,170,172,174) --({VENDEDOR})

