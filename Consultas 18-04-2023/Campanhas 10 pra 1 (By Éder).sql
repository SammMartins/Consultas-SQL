select a.codpromocao, f.descricao,f.dtinicio, f.dtfim, a.numped, a.data, a.codcli, substr(b.cliente,1,15) as Cliente, 
d.nome as supervisor, a.codusur, substr(c.nome,1,10) as Vendedor, a.qt as Quantidade,(a.pvenda*(a.qt)) as Valor
from pcpedi a, pcclient b, pcusuari c, pcsuperv d, pcbrindeex f, pcbrindeexpremio g, pcprodut h
where  a.codcli = b.codcli
and    a.codusur = c.codusur
and    c.codsupervisor = d.codsupervisor
and    a.codpromocao = f.codbrex
and    a.codpromocao = g.codbrex
and    g.codprod = h.codprod
--and    a.codpromocao in (:codpromo)
and    a.data  between SYSDATE-30 and SYSDATE
--and    a.posicao in (:posicao)
--and    h.codfornec in (:codfornec)
and    a.codpromocao is not null

group by a.codpromocao, f.descricao,f.dtinicio, f.dtfim, a.qt,(a.pvenda*(a.qt)), a.numped, a.data, a.codcli, b.cliente, d.nome, a.codusur, c.nome
order by a.numped,a.data
