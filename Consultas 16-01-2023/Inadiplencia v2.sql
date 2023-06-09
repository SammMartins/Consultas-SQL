SELECT A.codusur RCA,A.codcli || ' ' || B.CLIENTE CLIENTE, 'R$' || REPLACE(round(A.valor,2), '.', ',') T�tulo, 
       'R$' || REPLACE(round((A.valor * 0.00333) * round(SYSDATE-A.dtvenc,0),2), '.', ',') "JUROS APROXIMADOS", 
       'R$' || REPLACE(round(A.valor + ((A.valor * 0.00333) * round(SYSDATE-A.dtvenc,0)), 2), '.', ',') Total,
       A.codcob COB, round(SYSDATE-A.dtvenc,0)  "DIAS VENCIMENTO", 
       A.dtemissao EMISSAO,A.dtvenc VENCIMENTO
       
       
from pcprest A
join pcclient B on A.codcli = B.codcli

where A.dtvenc between '01-jan-2020' and SYSDATE-6 --'{DATAINI}' AND '{DATAFIN}'
and A.vpago is NULL
and A.codusur in (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 156, 157, 158, 161, 164, 167, 168, 169, 170, 172, 174) --({VENDEDOR})
and A.codcob in ('7563','SERA','C','CHD1')

order by "DIAS VENCIMENTO" Desc, T�TULO Desc
--SELECT * from pcprest A where A.dtemissao between '01-jan-2020' and '12-jan-2023'

--select * from pcclient

