SELECT p.codprod,p.descricao,p.codfornec,p.codsec,e.dtultent,
       e.qtest "Estoque",(e.qtest - e.qtreserv) "QT. Disponível"
    FROM PCPRODUT p
        JOIN PCEST e on e.codprod = p.codprod
        JOIN PCPRODFILIAL f on f.codprod = p.codprod
    
    WHERE p.ENVIARFORCAVENDAS LIKE 'S'
        AND p.OBS2 NOT LIKE 'FL' AND e.codfilial = 3 AND e.dtultsaida > '01-abr-2023'
        AND e.codfilial = 3
        AND e.dtultsaida > '01-abr-2023' 
        AND f.ENVIARFORCAVENDAS LIKE 'S'
        AND p.codfornec in (588,1321,1225,1623,1634,1541,1607,1728,1727,98,1719,1621,1488,1627,1761)
        --SELECT * FROM PCPRODUT --SELECT * FROM PCPRODFILIAL
    

