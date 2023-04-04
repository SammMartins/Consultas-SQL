SELECT DISTINCT ped.codcli, -- Seleciona apenas os códigos de clientes distintos (que não se repetem)
(Select pedc.codusur from pcpedc pedc where pedc.codcli = ped.codcli AND ROWNUM <= 1) RCA -- Seleciona o código de usuário (vendedor) do pedido registrado para cada cliente
                
FROM PCpedi ped -- A tabela base da consulta é a PCpedi, renomeada como "ped"
WHERE EXISTS -- Verifica se existe pelo menos um registro na subconsulta abaixo
(SELECT 1
  FROM PCpedi ped2 -- Tabela de pedidos, renomeada como "ped2"
    JOIN PCPEDC pedC ON ped2.numped = pedC.numped -- Junta a tabela de pedidos com a tabela do cabeçalho dos pedidos, relacionando pelo número do pedido
  
  WHERE ped2.data BETWEEN SYSDATE-7 AND SYSDATE -- Restringe a busca aos registros dos últimos sete dias
    AND ped2.posicao != 'F' AND ped2.posicao != 'C' -- Exclui da busca os registros com posição "F" ou "C" (faturado e cancelado)
    AND ped.codcli = ped2.codcli -- Relaciona o registro atual com o registro da subconsulta pelo código do cliente
    AND pedC.CONDVENDA NOT IN (5,11) -- Exclui da busca os registros da tabela de pedidos cancelados com status de venda 5 ou 11 (BNF e Troca)
  
  GROUP BY ped2.codprod -- Agrupa os registros da subconsulta pelo código do produto
    HAVING COUNT(*) > 1) -- Retorna apenas os registros que têm mais de uma ocorrência do mesmo produto para o mesmo cliente
    
group by ped.codcli
    
