
require "gerint/version"
require "gerint/comunicacao/comunicacao"

#Servicos
require "gerint/servicos/padrao"
require "gerint/servicos/internacao"
require "gerint/servicos/solicitacao_internacao"
require "gerint/servicos/solicitacao_internacao_psiquiatria"

module Gerint
  class Error < StandardError; end  # Deixado aqui como exemplo, pra criar uma classe de erros
end
