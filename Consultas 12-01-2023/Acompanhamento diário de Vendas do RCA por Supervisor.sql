--Acompanhamento diário de Vendas do RCA por Supervisor
SELECT RCA.codusur || ' - ' || RCA.nome Vendedor

from PcUsuari RCA

WHERE RCA.bloqueio like 'N'
and RCA.nome like '%DANONE%'
and RCA.codsupervisor in  (2,8,9)--({SUPERVISOR})
