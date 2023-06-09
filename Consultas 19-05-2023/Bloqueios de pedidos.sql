SELECT DISTINCT(a.NUMPED),a.codcli,d.cliente,a.codusur,a.posicao "posi.",a.data || ' às ' || b.hora||'H' "Envio",
                b.obs "MOTIVO ANALISADO",c.motivo "MOTIVO SISTEMA"
                
FROM pcpedi a
    JOIN pcpedc b on a.numped = b.numped
    JOIN PCBLOQUEIOSPEDIDO c on a.numped = c.numped
    JOIN pcclient d on d.codcli = a.codcli --SELECT * FROM PCclient
    
WHERE a.data BETWEEN SYSDATE-7 and SYSDATE
    AND a.codusur in (141,140,142,157) --or a.codusur in (153,164,143)
                     --(158,155,156,167,169,170,172)
                     --(148,145,150,151,152,168,174)
    AND a.posicao Not Like 'F' AND a.posicao Not Like 'M' 
    --AND a.posicao Not Like 'L' 
ORDER BY CODCLI,NUMPED
