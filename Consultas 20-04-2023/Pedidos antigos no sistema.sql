SELECT DISTINCT a.NUMPED,a.codusur,a.posicao,a.data
FROM pcpedi a
WHERE (SYSDATE - a.DATA > 6) and  (SYSDATE - a.DATA < 30)
AND a.posicao != 'F' AND a.posicao != 'C'
AND a.codusur in (140,141,142,145,148,150,151,152,153,155,156,
                    157,158,164,167,168,169,170,172,174)
