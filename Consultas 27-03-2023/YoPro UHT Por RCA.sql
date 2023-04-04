SELECT  distinct a.CODUSUR RCA,
-----------------------------------------------------------------------------------------------------------------------
    (select (sum(qt))/24 from pcpedi c
        where c.codprod in (17883,17884,17885,18173)
            and c.pvenda < 6.99
            and c.DATA BETWEEN '01-mar-2023' and SYSDATE
            and c.codusur = a.CODUSUR)  qtCaixas
-----------------------------------------------------------------------------------------------------------------------
    from pcpedi a 
        join pcusuari b on a.codusur = b.codusur
    where a.codprod in (17883,17884,17885,18173)
        and a.pvenda < 6.99
        and a.DATA BETWEEN '01-mar-2023' and SYSDATE
        --and b.codsupervisor in (2,8,9)
