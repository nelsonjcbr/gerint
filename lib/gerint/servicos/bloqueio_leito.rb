
module Gerint
    
    class BloqueioLeito < Gerint::Padrao
        attr_accessor :identLeito, :codTipoLeito, :identMotivoBloqueio

        def as_json(options={})
            h = {
                identLeito: @identLeito, 
                codTipoLeito: @codTipoLeito,
                identMotivoBloqueio: @identMotivoBloqueio
            }
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

