select pcclient.codcli, 
       pcclient.cliente, 
       pcclient.codusur1, 
       PCUSUARI.nome
from pcclient

INNER JOIN PCUSUARI
ON pcclient.codusur1 = PCUSUARI.codusur

WHERE codusur1 != 100
and PCUSUARI.bloqueio like 'N'
and PCUSUARI.nome like 'DANONE%'
and PCUSUARI.codsupervisor in (4,8,9)
and PCUSUARI.codusur = 155

order by codcli asc;
