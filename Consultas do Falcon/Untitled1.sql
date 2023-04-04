select 
C.NOME SUPERVISOR,
a.nome,
(
SELECT 
COUNT(B.CODCLI) QTD_CLIENTES_ROTA

 FROM PCROTACLI B
WHERE 
B.CODUSUR = A.CODUSUR
AND
B.dtproxvisita =   TO_DATE(SYSDATE) 
) CLIENTES_ROTA_DIA,

--------------------------------------------------
(select count(DISTINCT B.CODCLI)
from pcpedc b
where
b.codusur = a.codusur
and
b.data between '{DATAINI}' AND '{DATAFINI}'
and
b.condvenda <> 5
) POSITIVAÇÃO,

--------------------------------------------------------------------

(select 
count(DISTINCT B.CODCLI) POSITIVADO_ROTA
from pcpedc b 
where
-----------------------------------------------------
 EXISTS(
select 
C.CODCLI
from pcrotacli C
where 
C.dtproxvisita =  TO_DATE(SYSDATE)
AND
C.CODCLI = B.CODCLI
)
--------------------------------------------
and
b.condvenda <> 5
AND
B.CODUSUR = A.CODUSUR
and
b.data between '{DATAINI}' AND '{DATAFINI}') POS_EM_ROTA,

(select 
count(DISTINCT B.CODCLI) POSITIVADO_ROTA
from pcpedc b 
where
----------------------------------------------
NOT EXISTS(
select 
C.CODCLI
from pcrotacli C
where 
C.dtproxvisita =  TO_DATE(SYSDATE)
AND
C.CODCLI = B.CODCLI
)
----------------------------------------
and
b.condvenda <> 5
AND
B.CODUSUR = A.CODUSUR
and
b.data between '{DATAINI}' AND '{DATAFINI}'

) POS__FORA_DE_ROTA,


-------------------------------------------------------------------


(select NVL(SUM(B.QT*B.PVENDA),0)
from PCPEDI b
join pcpedc c on b.numped = c.numped
where
c.condvenda <> 5
and 
b.codusur = a.codusur
and
b.data between '{DATAINI}' AND '{DATAFINI}'
)
VENDA, 


(select count(b.numped)
from pcpedc b
where
b.condvenda <> 5
and
b.codusur = a.codusur
and
b.data between '{DATAINI}' AND '{DATAFINI}'
) PEDIDOS



 from pcusuari a JOIN PCSUPERV C ON A.CODSUPERVISOR = C.CODSUPERVISOR
where

a.codsupervisor IN ({SUPERVISOR})

and
a.bloqueio = 'N'
AND
A.dttermino IS NULL

ORDER BY SUPERVISOR, NOME
