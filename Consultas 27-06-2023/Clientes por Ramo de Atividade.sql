SELECT distinct b.codcli,b.cliente,B.CGCENT,b.MUNICENT,a.ramo
FROM PCCLIENT B JOIN Pcativi a on b.CODATV1 = a.CODATIV
WHERE b.TIPOFJ LIKE 'J' AND b.dtultcomp > SYSDATE-90
ORDER BY CODCLI

