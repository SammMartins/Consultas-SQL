SELECT a.CODUSUR,b.CODFORNEC,SUM((a.QT*a.pvenda)-(a.qt*a.vlbonific)) AS "TOTAL",
       (SELECT COUNT(DISTINCT CODCLI) FROM pcpedi l JOIN PCprodut o on l.codprod = o.codprod
       where l.codusur = a.codusur and l.data BETWEEN '01-mai-2023' AND SYSDATE
       AND o.codfornec = b.codfornec) AS "DN"
FROM PCPEDI a
JOIN PCprodut b on a.codprod = b.codprod
where a.codusur in (140, 141, 142, 145, 148, 150, 151, 152, 153, 155, 156, 157,158, 164, 167, 168, 169, 170, 172, 174)
and a.data BETWEEN '01-mai-2023' AND SYSDATE
AND b.codfornec in (1321,1225,1634,1541,1607,1623,1728,1727)
--and a.codcli in (14035--14035,607,1427,8976,1507,15052,1509,8416,15096)
GROUP BY a.CODUSUR,b.CODFORNEC
ORDER BY a.CODUSUR,"TOTAL" desc

--SELECT * FROM PCPEDI WHERE data BETWEEN '1-mai-2023' AND SYSDATE AND codusur in (140) and posicao LIKE 'F' and codcli = 14035     
