SELECT A.codsupervisor SUPERVISOR,A.codusur RCA,A.codcli || ' ' || B.CLIENTE CLIENTE, 
       A.valor Título, A.codcob COB, round(SYSDATE-A.dtemissao,0)  TOT_DIAS,
       A.dtemissao EMISSAO,A.dtvenc VENCIMENTO,A.vpago VALOR_PAGO
       
       
from pcprest A
join pcclient B on A.codcli = B.codcli

where A.dtemissao between '01-jan-2020' and '12-jan-2023'
and A.vpago is NULL


--SELECT * from pcprest A where A.dtemissao between '01-jan-2020' and '12-jan-2023'

--select * from pcclient
