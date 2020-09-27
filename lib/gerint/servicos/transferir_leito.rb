
module Gerint
    
    class TransferirLeito < Gerint::Padrao
        attr_accessor :protocoloSolicitacao, :identificacaoLeito, :codTipoLeito, :justifTransferencia, :leitoExtra

        def as_json(options={})
            h = {
                protocoloSolicitacao: @protocoloSolicitacao, 
                identificacaoLeito: @identificacaoLeito, 
                codTipoLeito: @codTipoLeito,
            }
            
            h.store(:justifTransferencia , @justifTransferencia) unless @justifTransferencia.nil?
            h.store(:leitoExtra, @leitoExtra) unless @leitoExtra.nil?
            h
        end

        def all_json # Gera hash com todas as variaveis de instancia
            vinstancia = self.instance_variables  
            h = {}
            vinstancia.each do |v|
                h.store(v[1..50], "#{v}") # BUG: v contem o nome da variavel e não o valor int
            end
            h
            h.to_json
        end
        
        def to_json(*options)
            as_json(*options).to_json(*options)
        end
 
    end
    
end 

