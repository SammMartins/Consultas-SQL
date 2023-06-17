SELECT *
FROM (
    SELECT DISTINCT a.codprod, 
           b.codfornec || '' AS codfornec, 
           b.Descricao AS PRODUTO, 
           SUM(a.qt) AS qt_ped, 
    ------------------------------------------------------------------------------       
           '|' AS "|",
           (CASE WHEN (SUM(a.qt) / b.qtunitcx) >= 1 
                 THEN TRUNC((SUM(a.qt) / b.qtunitcx),0)||' Caixas'||' e '||TRUNC(MOD(SUM(a.qt),b.qtunitcx))||' Unidades'
                 ELSE '0 Caixas e '||SUM(a.qt) || ' Unidades' 
            END) AS "SEPARAÇÃO p/ CARGA",
           '|' AS "-",
    ------------------------------------------------------------------------------
           b.PESOBRUTO * SUM(a.qt) AS PESOTOTAL
           
    FROM PCPEDI a
    JOIN PCPRODUT b ON a.codprod = b.codprod
    JOIN PCPEDC c ON a.numped = c.numped
    WHERE c.numcar = 194125
    GROUP BY a.codprod, b.codfornec, b.Descricao, b.qtunitcx, b.PESOBRUTO
-------------------------------------------------------------------------------------------------------------------------------
    UNION ALL
    SELECT NULL AS "CODPROD",
           '  CARGA' AS "CODFORNEC",
           'Nº ' || c.numcar || ' - ' || 'Destino: ' || carg.destino AS "PRODUTO",
           NULL AS "QT_PED",
           '|' AS "|",
           '  Peso Total da Carga:' AS "SEPARAÇÃO p/ CARGA",
           '|' AS "-",
           carg.totpeso AS PESOTOTAL
    FROM PCPEDI a
    JOIN PCPEDC c ON a.numped = c.numped
    JOIN PCCARREG carg ON c.numcar = carg.numcar
    WHERE c.numcar = 194125
    GROUP BY c.numcar, carg.totpeso, carg.destino
) subquery
ORDER BY 
  CASE WHEN codfornec IN ('588', '1321','1541','1623','1728') THEN 0 ELSE 1 END,
  CASE WHEN codfornec IN ('1761') THEN 1 ELSE 2 END,
  codfornec DESC,
  qt_ped DESC
  --adicionar codbarra, cliente e endereço
