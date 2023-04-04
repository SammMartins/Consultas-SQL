SELECT pcprodut.codprod, 
        pcprodut.descricao,  
        pcprodut.unidade, 
        pcprodut.embalagemmaster, 
        pcprodut.codfornec, 
        pcfornec.fornecedor
        
FROM pcprodut

INNER JOIN pcfornec /*tabela para junção*/
ON pcprodut.CODFORNEC = pcfornec.codfornec /*colunas equivalentes em ambas tabelas*/

WHERE codfilial = 3 
AND pcprodut.OBS2 != 'FL' /*OBS2 informa se está fora de linha*/

and pcprodut.codfornec in (98,588,1225,1321,1337,1488,1541,
                            1607,1621,1623,1627,1634,1652,1658) 
                        /*CODFORNEC apenas entre os especificados*/
    
order by pcprodut.descricao, pcprodut.codprod asc;

