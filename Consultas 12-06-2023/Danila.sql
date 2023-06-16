SELECT a.DATA,a.CODPROD,d.CODSUPERVISOR,a.CODUSUR,a.CODCLI,c.CLIENTE,c.ENDERENT,c.BAIRROENT,
       c.MUNICENT,b.CODFORNEC,a.QT,a.PVENDA,a.QT*a.PVENDA TOTAL,b.CODSEC,b.QTUNITCX
 
FROM PCPEDI a
JOIN PCPRODUT b on a.codprod = b.codprod
JOIN pcclient c on a.codcli = c.codcli
JOIN PCusuari d on a.CODUSUR = d.CODUSUR

WhERE a.data BETWEEN '01-jun-2023' and SYSDATE
    AND b.codfornec = 1658

ORDER BY a.CODPROD,a.DATA
