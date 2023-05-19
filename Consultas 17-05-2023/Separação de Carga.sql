SELECT DISTINCT(a.codprod), b.codfornec||'' codfornec, b.Descricao PRODUTO, 
       SUM(a.qt) qt_ped, '|' "|",
    --------------------------------------------------------------------------------
       (CASE WHEN (SUM(a.qt) / b.qtunitcx) >= 1 
             THEN TRUNC((SUM(a.qt) / b.qtunitcx),0)||' Caixas'||' e '||TRUNC(MOD(SUM(a.qt),b.qtunitcx))||' Unidades'
             Else '0 Caixas e '||SUM(a.qt) || ' Unidades' 
        END) "SEPARAÇÃO p/ CARGA",
    --------------------------------------------------------------------------------
       b.PESOBRUTO * SUM(a.qt) AS PESOTOTAL
       
FROM PCPEDI a
    JOIN PCPRODUT b ON a.codprod = b.codprod
    JOIN PCPEDC c ON a.numped = c.numped
WHERE c.numcar = 193975 --Alterar abaixo também
    --and c.numnota in ()
GROUP BY a.codprod,b.codfornec, b.Descricao, b.qtunitcx, b.PESOBRUTO
----------------------------------------------------------------------------------------------------------------------------------------------------------------
UNION ALL
SELECT
  NULL AS "CODPROD",
  '  CARGA' AS "CODFORNEC",
  'Nº '||c.numcar || ' - '||'Destino: '||carg.destino AS "PRODUTO",
  NULL AS "QT_PED",
  '|' AS "Uni. p/ Caixa",
  '  Peso Total da Carga:' AS "SEPARAÇÃO p/ CARGA",
  Carg.totpeso AS PESOTOTAL
FROM
  PCPEDI a
  JOIN PCPRODUT b ON a.codprod = b.codprod
  JOIN PCPEDC c ON a.numped = c.numped
  JOIN PCCARREG Carg on c.numcar = carg.numcar
WHERE
  c.numcar = 193975 -- Alterar acima também
GROUP BY
  c.numcar,
  Carg.totpeso,
  carg.destino
ORDER BY
  codfornec desc,
  qt_ped DESC
