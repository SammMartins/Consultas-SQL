SELECT COUNT(DISTINCT(a.NUMPED))"Nº DE BLOQUEADOS"    
FROM pcpedi a
WHERE a.codusur in (140, 141, 142, 143, 145, 148, 150, 151, 152, 153, 155, 
                    156,157, 158, 161, 164, 167, 168, 169, 170, 172, 174,161)
    and  (SYSDATE - a.DATA < 6)
    AND a.posicao Like 'B' OR a.posicao Like 'P' 

