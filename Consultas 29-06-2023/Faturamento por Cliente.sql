SELECT * FROM(
WITH DATA AS (SELECT '1-jan-2023' DATAINI , '30-jun-2023' DATAFIM FROM DUAL),
FAT AS 
    (SELECT DISTINCT(PC.CODCLI) CLIENTE,SUM(PC.VLATEND) Faturado      
        FROM PCPEDC PC
        JOIN DATA D on 1 = 1
        WHERE pc.data BETWEEN d.DATAINI AND d.DATAFIM
            AND PC.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98) AND PC.CODCOB NOT LIKE 'BNF'
            AND PC.POSICAO LIKE 'F'
        GROUP BY PC.CODCLI),--select * from pcpedc WHERE POSICAO LIKE 'F'
-------------------------------------------------------------------------------------------------------------------------
DEVOL AS 
    (SELECT DISTINCT(mov.CODCLI)CLIENTE, SUM(mov.qt*mov.punit) DEVOLVIDO
        FROM pcmov mov 
        JOIN DATA D on 1 = 1
        WHERE mov.dtmov BETWEEN d.DATAINI AND d.DATAFIM
            AND mov.codoper LIKE 'ED'
        GROUP BY mov.CODCLI)
        
-------------------------------------------------------------------------------------------------------------------------
        
SELECT a.CODUSUR1 RCA,a.CODCLI,a.CLIENTE,
       (CASE WHEN d.devolvido < 0 THEN (f.faturado) 
             WHEN d.devolvido > 0 THEN (f.faturado) - (d.devolvido)
             ELSE (f.faturado) - (d.devolvido) END) Faturamento,
       '|' "|",
       a.CGCENT CNPJ,a.FANTASIA,a.MUNICENT,
       a.DTCADASTRO 
FROM PCCLIENT A
JOIN FAT F on f.CLIENTE = a.CODCLI
JOIN DEVOL D on d.CLIENTE = a.CODCLI

--WHERE a.codcli = 1548

ORDER BY faturamento DESC
) where ROWNUM <= 30
