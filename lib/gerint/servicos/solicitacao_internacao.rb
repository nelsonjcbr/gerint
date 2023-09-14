
module Gerint
    
    class SolicitacaoInternacao < Gerint::Padrao
        attr_accessor :cartaoSus, :cpfPaciente, :tipoInternacao, :numeroProtocoloOrigem, :tipoProtocoloOrigem, :tipoAcesso
        attr_accessor :internacaoPropria, :tipoLeito, :cidPrincipal, :cpfProfissionalSolicitante, :sinaisSintomas
        attr_accessor :justificativaInternacao, :cor, :frequenciaCardiaca, :frequenciaRespiratoria, :pressaoArterialMaxima
        attr_accessor :pressaoArterialMinima, :temperatura, :saturacaoO2, :sensorio, :debitoUrinario, :procedimento
        attr_accessor :dialise, :suporteO2, :fluxo, :fiO2, :satO2, :peep, :condicao, :nome, :sexo, :idade, :codigoMunicipio
        attr_accessor :endereco, :codigoEspecialidade, :isolamentoNecessario, :germe1, :germe2, :germe3, :germeMultiresistente
        attr_accessor :possuiComorbidade, :comorbidade1, :comorbidade2, :comorbidade3, :dataHoraNascimento, :dataSolicitacao,
        attr_accessor :tipoPaciente

        def as_json(options={})
            h = {   cidPrincipal: @cidPrincipal,
                    cpfProfissionalSolicitante: @cpfProfissionalSolicitante,
                    sinaisSintomas: @sinaisSintomas,
                    justificativaInternacao: @justificativaInternacao
            }
                    
            h.store(:cartaoSus,             @cartaoSus)             unless @cartaoSus.nil?
            h.store(:cpfPaciente,           @cpfPaciente)           unless @cpfPaciente.nil?
            h.store(:tipoInternacao,        @tipoInternacao)        unless @tipoInternacao.nil?
            h.store(:internacaoPropria,     @internacaoPropria)     unless @internacaoPropria.nil?
            h.store(:tipoLeito,             @tipoLeito)             unless @tipoLeito.nil?
            h.store(:numeroProtocoloOrigem, @numeroProtocoloOrigem) unless @numeroProtocoloOrigem.nil?
            h.store(:tipoAcesso,            @tipoAcesso)            unless @tipoAcesso.nil?
            h.store(:cor,                   @cor)                   unless @cor.nil?
            h.store(:frequenciaCardiaca,    @frequenciaCardiaca)    unless @frequenciaCardiaca.nil?
            h.store(:frequenciaRespiratoria, @frequenciaRespiratoria) unless @frequenciaRespiratoria.nil?
            h.store(:pressaoArterialMaxima, @pressaoArterialMaxima) unless @pressaoArterialMaxima.nil?
            h.store(:pressaoArterialMinima, @pressaoArterialMinima) unless @pressaoArterialMinima.nil?
            h.store(:temperatura,           @temperatura)           unless @temperatura.nil?
            h.store(:saturacaoO2,           @saturacaoO2)           unless @saturacaoO2.nil?
            h.store(:sensorio,              @sensorio)              unless @sensorio.nil?
            h.store(:debitoUrinario,        @debitoUrinario)        unless @debitoUrinario.nil?
            h.store(:procedimento,          @procedimento)          unless @procedimento.nil?
            h.store(:dialise,               @dialise)               unless @dialise.nil?
            h.store(:suporteO2,             @suporteO2)             unless @suporteO2.nil?
            h.store(:fluxo,                 @fluxo)                 unless @fluxo.nil?
            h.store(:fiO2,                  @fiO2)                  unless @fiO2.nil?
            h.store(:satO2,                 @satO2)                 unless @satO2.nil?
            h.store(:peep,                  @peep)                  unless @peep.nil?
            h.store(:condicao,              @condicao)              unless @condicao.nil?
            h.store(:nome,                  @nome)                  unless @nome.nil?
            h.store(:sexo,                  @sexo)                  unless @sexo.nil?
            h.store(:idade,                 @idade)                 unless @idade.nil?
            h.store(:codigoMunicipio,       @codigoMunicipio)       unless @codigoMunicipio.nil?
            h.store(:endereco,              @endereco)              unless @endereco.nil?
            h.store(:codigoEspecialidade,   @codigoEspecialiade)    unless @codigoEspecialidade.nil?
            h.store(:isolamentoNecessario,  @isolamentoNecessario)  unless @isolamentoNecessario.nil?
            h.store(:germe1,                @germe1)                unless @germe1.nil?
            h.store(:germe2,                @germe2)                unless @germe2.nil?
            h.store(:germe3,                @germe3)                unless @germe3.nil?
            h.store(:germeMultiresistente,  @germeMultiresistente)  unless @germeMultiresistente.nil?
            h.store(:possuiComorbidade,     @possuiComorbidade)     unless @possuiComorbidade.nil?
            h.store(:comorbidade1,          @comorbidade1)          unless @comorbidade1.nil?
            h.store(:comorbidade2,          @comorbidade2)          unless @comorbidade2.nil?
            h.store(:comorbidade3,          @comorbidade3)          unless @comorbidade3.nil?
            h.store(:dataHoraNascimento,    @dataHoraNascimento)    unless @dataHoraNascimento.nil?
            h.store(:dataSolicitacao,       @dataSolicitacao)       unless @dataSolicitacao.nil?
            h.store(:tipoPaciente,          @tipoPaciente)          unless @tipoPaciente.nil?
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

        def dataHoraNascimento=(value)
            @dataHoraNascimento=value.iso8601(3)
        end
        def dataSolicitacao=(value)
            @dataSolicitacao=value.iso8601(3)
        end
 
    end
    
end 

