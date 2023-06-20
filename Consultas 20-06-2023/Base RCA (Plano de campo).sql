SELECT distinct b.codcli,
       CASE WHEN a.codusur in (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158,161, 164, 167, 168, 169, 170, 172, 174) THEN a.codusur
       WHEN b.codusur1 in (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158,161, 164, 167, 168, 169, 170, 172, 174) THEN b.codusur1 
       WHEN c.codusur in (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158,161, 164, 167, 168, 169, 170, 172, 174) THEN b.codusur1 END RCA,
       b.cliente,b.ENDERENT,b.BAIRROENT,b.MUNICENT
       
FROM PCUSURCLI a
    JOIN pcclient b on b.codcli = a.codcli
    JOIN pcpedc c on c.codcli = a.codcli


