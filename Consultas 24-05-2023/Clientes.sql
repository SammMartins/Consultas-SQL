SELECT DISTINCT(a.codcli),a.cliente,(CASE WHEN a.municcob is null THEN a.MUNICENT ELSE a.municcob END) Municipio,SUM(b.vltotal)"Ult. Compra"
FROM PCCLIENT a
JOIN PCPEDC b on b.codcli = a.codcli
WHERE a.dtultcomp = b.data
AND a.dtultcomp > SYSDATE - 5
GROUP BY a.codcli,a.cliente,a.municcob,a.MUNICENT
