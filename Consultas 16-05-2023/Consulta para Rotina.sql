SELECT a.data,a.codprod,a.CODCLI,a.CODUSUR,b.CODFORNEC,a.QT,a.QT*a.pvenda TOTAL,b.CODSEC,a.QTUNITCX,b.PESOBRUTO*a.QT PESOTOTAL
FROM PCPEDI a
JOIN PCprodut b on a.codprod = b.codprod
where a.codusur in (140, 141, 142, 145, 148, 150, 151, 152, 153, 155, 
                    156, 157,158, 164, 167, 168, 169, 170, 172, 174)
and a.data BETWEEN '1-mai-2023' AND SYSDATE

