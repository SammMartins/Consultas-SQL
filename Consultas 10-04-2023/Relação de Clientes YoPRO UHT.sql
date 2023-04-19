SELECT DISTINCT(a.CODCLI) CODCLI, b.CLIENTE RAZ�O, b.CGCENT CNPJ
FROM PCMOV a JOIN pcclient b on a.codcli = b.codcli 
WHERE a.DTMOV BETWEEN '03-abr-2023' and SYSDATE
AND a.CODPROD in (17883, 17884, 17885, 18173)
AND a.PUNIT < 6.99
GROUP BY a.CODCLI,b.CLIENTE,b.CGCENT
