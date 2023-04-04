select codprod, descricao, codsec, codfornec, PERICM from pcprodut where PERICM != 0 and obs2 not like 'FL'
and codsec in (10042,120239,10047,10046,10040) --Danone 
                 --,10050, --Sulminas
                    --120423, --Doces (Docile?)
                        --10044, --Gulositos
                            --10043, --Florestal
                                --120387, --Dafruta
                                    --120424, --Danilla
                                        --6004, --Bivolt
                                            --120422, --Avinor
                                                --10001, --MASSA LEVE (Massa Pastel)
                                                    --1005, --Hits
                                                        --1023, --Santa Massa
                                                            --10041) --Frutap
                                                
