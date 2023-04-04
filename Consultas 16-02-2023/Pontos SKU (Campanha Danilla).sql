Select rca.nome,
--------------------------------------------------------------------------------
SUM((SELECT COUNT(COUNT (DISTINCT(A.CODPROD)))
    FROM PCPEDI A 
    JOIN PCPRODUT C ON A.CODPROD = C.CODPROD
    WHERE A.DATA BETWEEN '30-JAN-2023' AND '30-abr-2023'
    AND C.CODFORNEC = 1658
    AND A.CODUSUR = rca.CODUSUR
    and A.posicao like 'F'
    GROUP BY A.CODCLI, A.CODPROD
)) Pontos_sku
--------------------------------------------------------------------------------
from pcusuari rca
Where rca.codsupervisor in (2,8,9)--({SUPERVISOR})
and rca.codusur not in (2,139,149,160,143,144)
and rca.nome like 'DANONE%'

group by rca.nome
