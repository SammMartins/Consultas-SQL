SELECT CODCLI,MUNICENT CIDADE,CODUSUR1,CODUSUR2,dtultalter,dtultcomp FROM pcclient 
WHERE CODUSUR1 = 10 AND CODUSUR2 = 10
AND dtultalter = '25-mai-2023'
and (SYSDATE - dtultcomp) < 90
