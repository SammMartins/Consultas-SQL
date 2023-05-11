SELECT * 
FROM PCCLIENT a
WHERE a.Horacadastro > '01-mai-2023'
AND EXISTS 
(SELECT DISTINCT(NUMPED) FROM PCMOV b Where b.codcli = a.codcli and b.dtmov > '01-mai-2023' and b.codprod in (17883, 17884, 17885, 18173))
