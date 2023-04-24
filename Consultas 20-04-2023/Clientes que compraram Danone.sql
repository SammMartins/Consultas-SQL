SELECT distinct(a.codcli),c.cliente,c.endercom,c.bairrocom,c.municcom
FROM PCMOV a
join pcprodut b on a.codprod = b.codprod
join pcclient c on a.codcli = c.codcli
WHERE a.dtmov BETWEEN '01-jan-2022' and '01-jan-2023'
and b.codfornec = 588
--select * from pcclient
