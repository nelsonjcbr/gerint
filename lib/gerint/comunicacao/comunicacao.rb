require "uri"
require "net/http"

module Gerint
  
  class Comunicacao
    attr_accessor :ambiente, :apikey, :usuario, :senha, :cnes

    def initialize(ambiente, apikey, usuario, senha, cnes)
      @ambiente = ambiente
      @apikey = apikey 
      @usuario = usuario
      @senha = senha
      
      @cnes = cnes
    end

    def credenciais # Consulta as credenciais instanciadas
      x = "ambiente = #{@ambiente} \n" 
      x += "apikey = #{@apikey} \n"
      x += "usuario = #{@usuario} \n"
      x += "senha = #{@senha} \n"
      x += "cnes = #{@cnes}"
    end

    def endereco_url
      if @ambiente == 'P' 
        "https://api.procempa.com.br/apiman-gateway/saude/api/1.0/gerint"
      elsif @ambiente == 'H' 
        "https://api-hom.procempa.com.br/apiman-gateway/saude/api/1.1/gerint"
      elsif @ambiente == 'P2' 
        "https://apigateway.procempa.com.br/apiman-gateway/saude/saude-api/1.0/gerint"
      elsif @ambiente == 'H2' 
        "https://apigateway-hom.procempa.com.br/apiman-gateway/saude/saude-api/1.0/gerint"
      else 
        "ERRO: Ambiente inválido, informa P, H, P2 ou H2"
      end
    end

    def executa_get(endereco)

      ender = endereco_url + endereco
      url = URI("#{ender}")

      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true
      
      request = Net::HTTP::Get.new(url)
      request["X-API-Key"] = @apikey
      request["usuario"] = @usuario
      request["senha"] = @senha
      request["cnes"] = @cnes
      request["Cookie"] = "SERVERID=WS4CH"
      
      response = https.request(request)
      response.read_body
    end        

    def executa_post(endereco, body)

      ender = endereco_url + endereco
      url = URI("#{ender}")

      https = Net::HTTP.new(url.host, url.port);
      https.use_ssl = true
      
      request = Net::HTTP::Post.new(url)
      request["X-API-Key"] = @apikey
      request["usuario"] = @usuario
      request["senha"] = @senha
      request["cnes"] = @cnes
      request["Content-Type"] = "application/json"
      request["Cookie"] = "SERVERID=WS4CH"
      request.body = body
 
      puts "***************************"
      puts request.body
      puts "***************************"
      
      response = https.request(request)
      response.read_body
 
    end        

    def busca_situacao_solicitacoes
      ender = "/solicitacoes/buscaSituacaoSolicitacoes"
      retorno = self.executa_get(ender)
    end

    def busca_solicitacoes_executante(filtros="")
      ender = "/solicitacoes/buscaSolicitacoesExecutante#{filtros}"
      retorno = self.executa_get(ender)
    end

    def solicitacao_internacao(solicitacao_internacao)
      ender = "/solicitacoes"
      body = solicitacao_internacao.to_json
      retorno = self.executa_post(ender, body)
    end

    def solicitacao_internacao_psiquiatria(solicitacao_internacao_psiquiatria)
      ender = "/solicitacoes/psiquiatria"
      body = solicitacao_internacao_psiquiatria.to_json
      retorno = self.executa_post(ender, body)
    end

    def internacao(internacao)
      ender = "/internacoes"   # Usado para internações e internações psiquiatricas
      body = internacao.to_json
      retorno = self.executa_post(ender, body)
    end

    def reversao_internacao(reversao_internacao)
      ender = "/internacoes/reverterInternacao"   # Usado para reversao de internações
      body = reversao_internacao.to_json
      retorno = self.executa_post(ender, body)
    end
 
    def alta(alta)
      ender = "/internacoes/liberar"   # No GERINT o serviço é chamado de Liberação de Internação
      body = alta.to_json
      retorno = self.executa_post(ender, body)
    end

    def reversao_alta(reversao_alta)
      ender = "/internacoes/reverterAlta"   # Usado para reversao de internações
      body = reversao_alta.to_json
      retorno = self.executa_post(ender, body)
    end

    def transferir_leito(transf)
      ender = "/internacoes/transferir"
      body = transf.to_json
      retorno = self.executa_post(ender, body)
    end
 
  end

end
