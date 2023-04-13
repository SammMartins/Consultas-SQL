SELECT A.codusur RCA,A.codcli || ' ' || B.CLIENTE CLIENTE, round(A.valor,2) Título, 
       round((A.valor * 0.00333) * round(SYSDATE-A.dtvenc,0),2) Juros_Aproximado, 
       round(A.valor + ((A.valor * 0.00333) * round(SYSDATE-A.dtvenc,0)), 2) Total,
       A.codcob COB, round(SYSDATE-A.dtvenc,0)  DIAS_VENCIMENTO, 
       A.dtemissao EMISSAO,A.dtvenc VENCIMENTO,'R$0' || A.vpago VALOR_PAGO
       
       
from pcprest A
join pcclient B on A.codcli = B.codcli

where A.dtvenc between '01-jan-2020' and SYSDATE --'{DATAINI}' AND '{DATAFIN}'
and A.vpago is NULL
and A.codusur in (140,141,142,145,148,149,150,151,152,153,155,156,
                    157,158,160,164,167,168,169,170,172,174) --({VENDEDOR})
and A.codcob in ('7563','SERA','C','CHD1')

order by DIAS_VENCIMENTO Desc, TÍTULO Desc
--SELECT * from pcprest A where A.dtemissao between '01-jan-2020' and '12-jan-2023'

--select * from pcclient


