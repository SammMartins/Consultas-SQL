SELECT DISTINCT(a.NUMPED)"N� PEDIDO",
       u.codsupervisor "Superv.",
       (u.codusur || ' - ' || SUBSTR(u.nome,4,9)) AS Vendedor,
       TO_CHAR(a.data, 'DD/MM') || ' �s ' || b.hora||'H' AS Envio,
       
       (CASE WHEN a.posicao like 'B' Then a.posicao||'loqueado' 
             WHEN a.posicao like 'C' Then a.posicao||'ancelado' 
             ELSE a.posicao||'iberado' END) AS Status,
             
       'R$'||REPLACE(b.vltotal, '.', ',') "Valor R$", '|' "|",
       a.codcli|| ' - ' ||SUBSTR(d.cliente,0,30) AS Cliente,
       
       (CASE WHEN b.obs IS NULL Then '|NAO ANALISADO|' 
             ELSE b.obs END) AS "MOTIVO ANALISADO",
             
       (SELECT LISTAGG(c.motivo, ' | ') WITHIN GROUP (ORDER BY c.motivo desc)
               FROM PCBLOQUEIOSPEDIDO c 
               WHERE a.numped = c.numped) AS "MOTIVO SISTEMA"
               
FROM pcpedi a
    JOIN pcpedc b on a.numped = b.numped
    JOIN PCBLOQUEIOSPEDIDO c on a.numped = c.numped
    JOIN pcclient d on d.codcli = a.codcli 
    JOIN PCUSUARI U on U.codusur = a.codusur
WHERE a.data BETWEEN SYSDATE-14 and SYSDATE
    AND a.codusur in (140, 141, 142, 157,143, 145, 148, 150, 151, 152, 153, 155, 
                      156,  158, 161, 164, 167, 168, 169, 170, 172, 174, 2, 160)
    AND a.posicao Not Like 'F' AND a.posicao Not Like 'M' 
ORDER BY "N� PEDIDO"
