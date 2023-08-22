
require "gerint/version"
require "gerint/comunicacao/comunicacao"

#Servicos
require "gerint/servicos/padrao"
require "gerint/servicos/internacao"
require "gerint/servicos/transferir_leito"
require "gerint/servicos/alta"
require "gerint/servicos/solicitacao_internacao"
require "gerint/servicos/solicitacao_internacao_psiquiatria"
require "gerint/servicos/reversao_internacao"
require "gerint/servicos/reversao_alta"
require "gerint/servicos/desbloqueio_leito"
require "gerint/servicos/bloqueio_leito"
require "gerint/servicos/evolucao_paciente"

module Gerint
  class Error < StandardError; end  # Deixado aqui como exemplo, pra criar uma classe de erros
end
