SELECT bloqueio, 
       codfilial, 
       codusur, 
       nome, 
       codsupervisor, 
       tipovend, 
       cidade
FROM PCUSUARI

WHERE bloqueio like 'N'
and nome like 'DANONE%'
and codsupervisor in (4,8,9)

order by codusur;

