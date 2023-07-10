select a.codcli,
       a.codcli || ' - ' || a.cliente cliente
            
from PCCLIENT a
    join pcusuari c on a.codusur1 = c.codusur

where c.codusur in (140,141,142,145,148,149,150,151,152,153,155,
                    156,157,158,160,164,167,168,169,170,172,174)

group by a.codcli, a.cliente

order by a.codcli asc
