
module Gerint
    
    class Alta < Gerint::Padrao
        attr_accessor :protocoloSolicitacao, :dataAlta, :identMotivoAlta, :cpfMedicoAlta, :identEncaminhamentoPosAlta
        attr_accessor :resumoInternacao, :prescricaoAlta, :cidPrincipal
        attr_accessor :fileName, :mimeType, :conteudo

        def as_json(options={})
            h = {
                protocoloSolicitacao:   @protocoloSolicitacao, 
                dataAlta:               @dataAlta,
                identMotivoAlta:        @identMotivoAlta
            }
            h.store(:fileName,          @fileName)          unless @fileName.nil?
            h.store(:mimeType,          @mimeType)          unless @mimeType.nil?
            h.store(:conteudo,          @conteudo)          unless @conteudo.nil?
            h.store(:cpfMedicoAlta,     @cpfMedicoAlta)     unless @cpfMedicoAlta.nil?
            h.store(:identEncaminhamentoPosAlta, @identEncaminhamentoPosAlta) unless @identEncaminhamentoPosAlta.nil?
            h.store(:resumoInternacao,  @resumoInternacao)  unless @resumoInternacao.nil?
            h.store(:prescricaoAlta,    @prescricaoAlta)    unless @prescricaoAlta.nil?
            h.store(:cidPrincipal,      @cidPrincipal)      unless @cidPrincipal.nil?
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

        def dataAlta=(value)
            @dataAlta=value.iso8601(3)
        end
 
    end
    
end 

