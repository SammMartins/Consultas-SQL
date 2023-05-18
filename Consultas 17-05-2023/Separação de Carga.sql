SELECT DISTINCT(a.codprod)||'' codprod, b.codfornec||'' codfornec, b.Descricao PRODUTO, 
       SUM(a.qt) qt_ped, --b.qtunitcx "Uni. p/ Caixa",
----------------------------------------------------------------------------------------------------------------------------------------------------------------
       (CASE WHEN (SUM(a.qt) / b.qtunitcx) >= 1 
             THEN TRUNC((SUM(a.qt) / b.qtunitcx),0)||' Caixas'||' e '||TRUNC(MOD(SUM(a.qt),b.qtunitcx))||' Unidades'
             Else '0 Caixas e '||SUM(a.qt) || ' Unidades' 
        END) "SEPARA��O p/ CARGA",
----------------------------------------------------------------------------------------------------------------------------------------------------------------
       b.PESOBRUTO * SUM(a.qt) AS PESOTOTAL
       
FROM PCPEDI a
    JOIN PCPRODUT b ON a.codprod = b.codprod
    JOIN PCPEDC c ON a.numped = c.numped
WHERE c.numcar = 193969 --Alterar abaixo tamb�m
GROUP BY a.codprod,b.codfornec, b.Descricao, b.qtunitcx, b.PESOBRUTO

----------------------------------------------------------------------------------------------------------------------------------------------------------------
UNION ALL
SELECT
  '_CARGA_' AS "CODPROD",
  '_N�MERO:_' AS "CODFORNEC",
  c.numcar || '' AS "PRODUTO",
  NULL AS "QT_PED",
  --NULL AS "Uni. p/ Caixa",
  '_Peso Total da Carga:_' AS "SEPARA��O p/ CARGA",
  SUM(b.PESOBRUTO * a.qt) AS PESOTOTAL
FROM
  PCPEDI a
  JOIN PCPRODUT b ON a.codprod = b.codprod
  JOIN PCPEDC c ON a.numped = c.numped
WHERE
  c.numcar = 193969 -- Alterar acima tamb�m
GROUP BY
  c.numcar
ORDER BY
  codfornec desc,
  qt_ped DESC
