SELECT DISTINCT(a.NUMPED)"Nº PEDIDO",u.codsupervisor "Superv.",(u.codusur || ' - ' || SUBSTR(u.nome,4,9)) AS "Vendedor",
                TO_CHAR(a.data, 'DD/MM') || ' às ' || b.hora||'H' Envio,
                (CASE WHEN a.posicao like 'B' Then a.posicao||'loqueado' WHEN a.posicao like 'C' Then a.posicao||'ancelado' ELSE a.posicao||'iberado' END) Status,
                'R$'||REPLACE(b.vltotal, '.', ',') "Valor R$",'|' "|",a.codcli|| ' - ' ||SUBSTR(d.cliente,0,30) Cliente,
                (CASE WHEN b.obs IS NULL Then '|NAO ANALISADO|' ELSE b.obs END) "MOTIVO ANALISADO",
                (SELECT LISTAGG(c.motivo, ' | ') WITHIN GROUP (ORDER BY c.motivo desc)FROM PCBLOQUEIOSPEDIDO c WHERE a.numped = c.numped) "MOTIVO SISTEMA"
                
FROM pcpedi a
    JOIN pcpedc b on a.numped = b.numped
    JOIN PCBLOQUEIOSPEDIDO c on a.numped = c.numped
    JOIN pcclient d on d.codcli = a.codcli 
    JOIN PCUSUARI U on U.codusur = a.codusur
    
WHERE a.data BETWEEN SYSDATE-8 and SYSDATE
    AND a.codusur in 
    (141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174,160,2)
    AND a.posicao Not Like 'F' AND a.posicao Not Like 'M' 

    
ORDER BY "Nº PEDIDO"
