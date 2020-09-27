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
      if ambiente = 'H' && apikey = ''  # Se não informar a apikey, pega os dados de teste do HEPA
        @apikey  = "0ecc120b-c3bf-4e71-a5f9-cbaf0e394e34"
        @usuario = "integracao.2237180"
        @senha   = "integracao.2237180"
        @cnes    = "2237180"
      end
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
      else 
        "ERRO: Ambiente inválido, informa P para produção ou H para Homologação"
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
 
    def alta(alta)
      ender = "/internacoes/liberar"   # No GERINT o serviço é chamado de Liberação de Internação
      body = alta.to_json
      retorno = self.executa_post(ender, body)
    end

    def transferir_leito(transf)
      ender = "/internacoes/transferir"
      body = alta.to_json
      retorno = self.executa_post(ender, body)
    end
 
  end

end
