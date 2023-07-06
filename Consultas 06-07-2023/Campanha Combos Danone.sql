WITH Contagem AS
(SELECT COUNT(DISTINCT(p.numped)) cont,p.codusur rca,
LISTAGG(p.codcli, '- ') WITHIN GROUP (ORDER BY p.codcli) clientes
FROM PCPEDI p
WHERE p.CODCOMBO in (118,119,120) 
AND p.data BETWEEN '01-jul-2023' AND SYSDATE
GROUP BY p.codusur)
----------------------------------------------------------------------------------------------------------------------------------------
SELECT (u.codusur || ' - ' || u.nome) AS "Vendedor"
        ,'R$'||c.cont"R$"
        ,c.clientes
       
FROM PCUSUARI u
    JOIN Contagem c ON u.codusur = c.rca
WHERE u.codusur IN (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174)
