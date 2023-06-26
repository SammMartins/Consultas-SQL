SELECT DISTINCT(a.NUMPED)"Nº PEDIDO",a.codusur rca, TO_CHAR(a.data, 'DD/MM') || ' às ' || b.hora||'H' Envio,
                (CASE WHEN a.posicao like 'B' Then a.posicao||'loqueado' WHEN a.posicao like 'C' Then a.posicao||'ancelado' ELSE a.posicao||'iberado' END) Status,
                'R$'||REPLACE(b.vltotal, '.', ',') "Valor R$",'|' "|",a.codcli|| ' - ' ||SUBSTR(d.cliente,0,30) Cliente,
                (CASE WHEN b.obs IS NULL Then 'NAO ANALISADO' ELSE b.obs END) "MOTIVO ANALISADO",
                (SELECT LISTAGG(c.motivo, ' | ') WITHIN GROUP (ORDER BY c.motivo desc)FROM PCBLOQUEIOSPEDIDO c WHERE a.numped = c.numped) "MOTIVO SISTEMA"
                
FROM pcpedi a
    JOIN pcpedc b on a.numped = b.numped
    JOIN PCBLOQUEIOSPEDIDO c on a.numped = c.numped
    JOIN pcclient d on d.codcli = a.codcli 
    
WHERE a.data BETWEEN SYSDATE-7 and SYSDATE
    AND a.codusur in --(153,143,148,145,150,151,152,168,174)
                     --(141,140,142,157)
                     --(158,155,156,167,161,169,170,172)
    (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174) --AND (SYSDATE - a.DATA > 3) and  (SYSDATE - a.DATA < 30)
    AND a.posicao Not Like 'F' AND a.posicao Not Like 'M' 
    --AND a.posicao Not Like 'L' 
    
    
ORDER BY "Nº PEDIDO"
