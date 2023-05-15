SELECT DISTINCT(a.NUMPED),a.codusur,a.posicao,a.data || ' às ' || b.hora||'H' "Envio",
                b.obs "MOTIVO ANALISADO",c.motivo "MOTIVO SISTEMA"
                
FROM pcpedi a
    JOIN pcpedc b on a.numped = b.numped
    JOIN PCBLOQUEIOSPEDIDO c on a.numped = c.numped
    
WHERE (SYSDATE - a.DATA > 3) and  (SYSDATE - a.DATA < 30) AND a.codusur in (140,141,142,145,148,150,151,152,155,156,157,158,167,168,169,170,172,174)
--WHERE (SYSDATE - a.DATA > 5) and  (SYSDATE - a.DATA < 30) AND a.codusur in (153,164) --and b.hora <= 12
    AND b.dtfat is null
    


