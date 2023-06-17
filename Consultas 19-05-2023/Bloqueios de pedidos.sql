SELECT DISTINCT(a.NUMPED)"Nº PEDIDO",'R$'||REPLACE(b.vltotal, '.', ',') "R$",a.codcli|| ' - ' ||d.cliente Cliente,
                a.codusur rca,(CASE WHEN a.posicao like 'B' Then a.posicao||'loqueado' ELSE a.posicao||'iberado' END) Status,
                TO_CHAR(a.data, 'DD/MM') || ' às ' || b.hora||'H' Envio,
                b.obs "MOTIVO ANALISADO",
                (SELECT LISTAGG(c.motivo, ' | ') WITHIN GROUP (ORDER BY c.motivo desc)FROM PCBLOQUEIOSPEDIDO c WHERE a.numped = c.numped) "MOTIVO SISTEMA"
                
FROM pcpedi a
    JOIN pcpedc b on a.numped = b.numped
    JOIN PCBLOQUEIOSPEDIDO c on a.numped = c.numped
    JOIN pcclient d on d.codcli = a.codcli 
    
WHERE a.data BETWEEN SYSDATE-7 and SYSDATE
    AND a.codusur in --(153,143,148,145,150,151,152,168,174)  
                     --(141,140,142,157,2) 
                     (158,155,156,167,169,170,172)
    AND a.posicao Not Like 'F' AND a.posicao Not Like 'M' 
    --AND a.posicao Not Like 'L' 
ORDER BY "Nº PEDIDO"
