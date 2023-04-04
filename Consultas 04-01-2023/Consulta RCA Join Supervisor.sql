SELECT
   PCUSUARI.codusur || ' - ' || PCUSUARI.nome /*concatenação de duas colunas*/ vendedor, /*renomeando a coluna*/
   pcsuperv.codsupervisor || ' - ' || pcsuperv.nome as supervisor
FROM PCUSUARI

INNER JOIN pcsuperv /*tabela para junção*/
ON PCUSUARI.codsupervisor = pcsuperv.codsupervisor /*colunas equivalentes em ambas tabelas*/

WHERE PCUSUARI.bloqueio like 'N'
and PCUSUARI.nome like '%DANONE%'
and PCUSUARI.codsupervisor in  (2,8,9)--({SUPERVISOR})

order by codusur
