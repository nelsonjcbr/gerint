# Gerint

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/gerint`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gerint'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gerint

## Usage

## Serviços disponíveis

### Conexão com o GERINT

Antes de executar qualquer serviço, deve ser criado uma conexão com o GERINT.

Exemplo:

```ruby
require 'gerint'
conexao = Gerint::Comunicacao.new(ambiente='H', apikey="0ecc120b-c3bf-4e71-a5f9-cbaf0e394e34", usuario="integracao.2237180", senha="integracao.2237180",    cnes="2237180")
```

### Busca situação das solicitações

Busca a situação das solicitações feitas no GERINT

Exemplo:

```ruby
conexao.busca_situacao_solicitacoes
```

### Solicitação de Internação

Registra uma solicitação de internação no GERINT.

Exemplo:

```ruby
sol = Gerint::SolicitacaoInternacao.new
sol.cartaoSus = "898004081765334"
sol.cpfPaciente = "79423914934"
sol.tipoInternacao = "URGENCIA"
sol.numeroProtocoloOrigem = ""
sol.tipoProtocoloOrigem = ""
sol.tipoAcesso = "samuPoa"
sol.internacaoPropria = "SIM"
sol.tipoLeito = "OBSTETRICO"
sol.cidPrincipal =  "J180"
sol.cpfProfissionalSolicitante = "47749504087"
sol.sinaisSintomas = "Paciente apresenta comprometimento da função hepática"
sol.justificativaInternacao = "Paciente necessita de cuidados prolongados, necessita internação para esse cuidado"
sol.cor = "LARANJA"
sol.frequenciaCardiaca = "80"
sol.frequenciaRespiratoria = "18"
sol.pressaoArterialMaxima = "120"
sol.pressaoArterialMinima = "80"
sol.temperatura = "37.5"
sol.saturacaoO2 = "089"
sol.sensorio = "ALERTA"
sol.debitoUrinario = "ANURIA"
sol.procedimento = "0404010415"
sol.dialise = "NAO"
sol.suporteO2 = "AR_AMBIENTE"
sol.codigoEspecialidade = "374974"
sol.isolamentoNecessario = "NAO"
sol.possuiComorbidade = "NAO"
conexao.solicitaInternacao(sol)
```

### Internação

Informa a internação de um paciente 

Exemplo:

```ruby
int=Gerint::Internacao.new
int.protocoloSolicitacao = "202000020923"
int.identificacaoLeito = "leito1"
int.codTipoLeito = "03"
int.dataInternacao = DateTime.now
conexao.internacao(int)
```

### Internação em Leito Extra

Informa a internação de um paciente em um leito extra

Exemplo:

```ruby
int=Gerint::Internacao.new
int.protocoloSolicitacao = "202000020923"
int.leitoExtra = true
int.identificacaoLeito = "leitoextra1"
int.codTipoLeito = "03"
int.dataInternacao = DateTime.now
conexao.internacao(int)
```

CONTINUAR AQUI

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gerint. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Gerint project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/gerint/blob/master/CODE_OF_CONDUCT.md).


