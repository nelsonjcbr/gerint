
module Gerint

    
    
    class EvolucaoPaciente < Gerint::Padrao

        attr_accessor :protocoloSolicitacao,:evolucaoDoCaso,:drogasVasoativas,:listaDrogasVasoativas, :dinamica
        attr_accessor :toqueNaoRealizado, :bcf, :bolsaIntegra, :dataHoraRuptura, :corLiquidoAminiotico, :grumos
        attr_accessor :ecografia, :descricaoEcografia, :fileName, :mimeType, :conteudo
        attr_accessor :frequenciaCardiaca, :frequenciaRespiratoria, :pressaoArterialMaxima, :pressaoArterialMinima
        attr_accessor :temperatura, :saturacaoO2, :sensorio, :debitoUrinario, :suporteO2, :fluxo
        attr_accessor :fiO2, :satO2, :peep, :isolamentoNecessario, :germe1, :germe2, :germe3, :germeMultiresistente



        def as_json(options={})
            h = {   protocoloSolicitacao: @protocoloSolicitacao,
                    evolucaoDoCaso:       @evolucaoDoCaso   }
            
            h.store(:drogasVasoativas,      @drogasVasoativas)      unless @drogasVasoativas.nil?
            h.store(:listaDrogasVasoativas, @listaDrogasVasoativas) unless @listaDrogasVasoativas.nil?
            h.store(:dinamica,              @dinamica)              unless @dinamica.nil?
            h.store(:toqueNaoRealizado,     @toqueNaoRealizado)     unless @toqueNaoRealizado.nil?
            h.store(:bcf,                   @bcf)                   unless @bcf.nil?
            h.store(:bolsaIntegra,          @bolsaIntegra)          unless @bolsaIntegra.nil?
            h.store(:dataHoraRuptura,       @dataHoraRuptura)       unless @dataHoraRuptura.nil?
            h.store(:corLiquidoAminiotico,  @corLiquidoAminiotico)  unless @corLiquidoAminiotico.nil?
            h.store(:grumos,                @grumos)                unless @grumos.nil?
            h.store(:ecografia,             @ecografia)             unless @ecografia.nil?
            h.store(:descricaoEcografia,    @descricaoEcografia)    unless @descricaoEcografia.nil?
            h.store(:fileName,              @fileName)              unless @fileName.nil?
            h.store(:mimeType,              @mimeType)              unless @mimeType.nil?
            h.store(:conteudo,              @conteudo)              unless @conteudo.nil?
            h.store(:frequenciaCardiaca,    @frequenciaCardiaca)    unless @frequenciaCardiaca.nil?
            h.store(:frequenciaRespiratoria, @frequenciaRespiratoria) unless @frequenciaRespiratoria.nil?
            h.store(:pressaoArterialMaxima, @pressaoArterialMaxima) unless @pressaoArterialMaxima.nil?
            h.store(:pressaoArterialMinima, @pressaoArterialMinima) unless @pressaoArterialMinima.nil?
            h.store(:temperatura,           @temperatura)           unless @temperatura.nil?
            h.store(:saturacaoO2,           @saturacaoO2)           unless @saturacaoO2.nil?
            h.store(:sensorio,              @sensorio)              unless @sensorio.nil?
            h.store(:debitoUrinario,        @debitoUrinario)        unless @debitoUrinario.nil?
            h.store(:suporteO2,             @suporteO2)             unless @suporteO2.nil?
            h.store(:fluxo,                 @fluxo)                 unless @fluxo.nil?
            h.store(:fiO2,                  @fiO2)                  unless @fiO2.nil?
            h.store(:satO2,                 @satO2)                 unless @satO2.nil?
            h.store(:peep,                  @peep)                  unless @peep.nil?
            h.store(:isolamentoNecessario,  @isolamentoNecessario)  unless @isolamentoNecessario.nil?
            h.store(:germe1,                @germe1)                unless @germe1.nil?
            h.store(:germe2,                @germe2)                unless @germe2.nil?
            h.store(:germe3,                @germe3)                unless @germe3.nil?
            h.store(:germeMultiresistente,  @germeMultiresistente)  unless @germeMultiresistente.nil?
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

