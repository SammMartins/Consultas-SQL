SELECT a.codusur as RCA, 
       SUM(CASE WHEN (a.ptabela - a.punit) < 0 THEN (a.punit - a.ptabela) * a.qt ELSE 0 END) AS "Verba Gerada"
FROM PCMOV a
WHERE a.dtmov BETWEEN '01-mai-2023' AND SYSDATE
  AND a.codusur = 140
GROUP BY a.codusur

