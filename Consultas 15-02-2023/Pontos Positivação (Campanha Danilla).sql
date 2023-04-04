select distinct c.nome,GREATEST((trunc((count(distinct b.codcli)*100)/NVL(METa.CLIPOSPREV,1),0))-100,0) Pontos_P
        from pcmov b 
        join pcusuari c on b.codusur = c.codusur
        join pcprodut d on b.codprod = d.codprod
        join PCMETA meta on b.codusur = meta.codusur
        where b.codusur not in (2,149,160,143)
        and c.codsupervisor in (2,8,9)--({SUPERVISOR})
        and b.codfornec = 1658
        and meta.CODIGO = 1658
        AND B.CODOPER = 'S'
        and b.dtmov between '01-FEV-2023' and '30-ABR-2023' 
        and meta.data = '01-fev-2023'
        group by c.nome,METa.CLIPOSPREV
       



