
module Gerint
    
    class SolicitacaoInternacaoPsiquiatria < Gerint::SolicitacaoInternacao
        attr_accessor :internacaoPsiquiatricaPrevia, :riscoHeteroagressao, :pacienteMotivado, :acompanhamentoPsiquiatricoAmbulatorial
        attr_accessor :usoSubstanciaPsicoativa, :substanciasPsicoativas, :suporteFamiliar, :planoSuicida
        attr_accessor :usoMedicamentoComorbidadesPsiquiatria, :medicamentoComorbidadePsiquiatria, :gravidaPsiquiatria
        
        # :dataSolicitacao campo que tem na solicitacao de internação mas não tem para psiquiatria

        def as_json_psiq(h)
            h.store(:internacaoPsiquiatricaPrevia,      @internacaoPsiquiatricaPrevia)  unless @internacaoPsiquiatricaPrevia.nil?
            h.store(:riscoHeteroagressao,               @riscoHeteroagressao)           unless @riscoHeteroagressao.nil?
            h.store(:pacienteMotivado,                  @pacienteMotivado)              unless @pacienteMotivado.nil?
            h.store(:acompanhamentoPsiquiatricoAmbulatorial, @acompanhamentoPsiquiatricoAmbulatorial) unless @acompanhamentoPsiquiatricoAmbulatorial.nil?
            h.store(:usoSubstanciaPsicoativa,           @usoSubstanciaPsicoativa)       unless @usoSubstanciaPsicoativa.nil?
            h.store(:substanciasPsicoativas,            @substanciasPsicoativas)        unless @substanciasPsicoativas.nil?
            h.store(:suporteFamiliar,                   @suporteFamiliar)               unless @suporteFamiliar.nil?
            h.store(:planoSuicida,                      @planoSuicida)                  unless @planoSuicida.nil?
            h.store(:usoMedicamentoComorbidadesPsiquiatria, @usoMedicamentoComorbidadesPsiquiatria) unless @usoMedicamentoComorbidadesPsiquiatria.nil?
            h.store(:medicamentoComorbidadePsiquiatria, @medicamentoComorbidadePsiquiatria) unless @medicamentoComorbidadePsiquiatria.nil?
            h.store(:gravidaPsiquiatria,                @gravidaPsiquiatria)            unless @gravidaPsiquiatria.nil?
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
            h = as_json(*options)
            as_json_psiq(h).to_json(*options)
        end

        def dataHoraNascimento=(value)
            @dataHoraNascimento=value.iso8601(3)
        end
        def dataSolicitacao=(value)
            @dataSolicitacao=value.iso8601(3)
        end
 
    end
    
end 

