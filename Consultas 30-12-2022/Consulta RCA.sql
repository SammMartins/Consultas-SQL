SELECT nome, 
       codusur, 
       codsupervisor
FROM PCUSUARI

WHERE bloqueio like 'N'
and nome like '%DANONE%'
and codsupervisor in (2,8,9)

order by codusur

