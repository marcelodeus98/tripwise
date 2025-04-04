﻿
# TripWise - Planejador de Viagens Inteligente

O **TripWise** é uma API que utiliza a inteligência artificial do Google Gemini (via `gemini_api_ruby`) para criar planos de viagem personalizados com base nas preferências do usuário, como datas, origem, destino, orçamento e acompanhantes.

## Funcionalidades

- Gera um roteiro de viagem personalizado.
- Fornece informações sobre segurança no destino.
- Recomenda os melhores hotéis e rotas de viagem.
- Adapta o plano de viagem com base no orçamento e estilo de viagem (solitário, em grupo, etc.).

## Tecnologias Utilizadas

- **Ruby**: Linguagem de programação principal.
- **Sinatra**: Framework web leve para criar a API.
- **gemini_api_ruby**: Gem para consumir a API do Google Gemini.
- **Postman**: Para testar as requisições à API.

## Como Configurar o Projeto

### Pré-requisitos

- Ruby 3.x instalado.
- Bundler instalado (`gem install bundler`).

### Passos para Configuração

###  Clone o repositório:
   git clone https://github.com/marcelodeus98/tripwise.git
   cd tripwise
###  Instale as dependências:

    bundle install

   #### Configure a chave da API do Gemini:

        Crie um arquivo .env na raiz do projeto.

        Adicione sua chave da API do Gemini no arquivo:
        .env

        GEMINI_API_KEY=sua_chave_aqui

   #### Execute o servidor:

    ruby app.rb

    O servidor estará disponível em http://localhost:4567.

## Como Usar a API
### Endpoint: Criar Plano de Viagem

  ####  Método: POST

   #### URL: http://localhost:4567/travel_plan

####    Cabeçalho:

        Content-Type: application/json

 ####   Corpo da Requisição (JSON):
   
    {
      "start_date": "29/09/2025",
      "end_date": "02/10/2025",
      "origin": "Cascavel-CE",
      "destination": "Curitiba-PR",
      "budget": 6000,
      "escorts": [
        {
          "has_escorts": false,
          "quantity": 0
        }
      ]
    }

   #### Resposta de Sucesso (JSON):
    
    {
      "itinerary": "## Roteiro de Viagem...",
      "violence_info": "Informações sobre segurança...",
      "best_hotel": "Melhor hotel recomendado...",
      "best_way": "Melhor rota de viagem..."
    }

#### Exemplo de Uso com Postman

    Abra o Postman.

    Defina o método para POST.

    Insira a URL: http://localhost:4567/travel_plan.

    No cabeçalho, adicione Content-Type: application/json.

    No corpo da requisição, selecione raw e insira o JSON com os dados da viagem.

    Clique em Send para enviar a requisição.


## Contribuição

### Contribuições são bem-vindas! Siga os passos abaixo:

    Faça um fork do projeto.

    Crie uma branch para sua feature (git checkout -b feature/nova-feature).

    Commit suas mudanças (git commit -m 'Adiciona nova feature').

    Faça push para a branch (git push origin feature/nova-feature).

    Abra um Pull Request.

## Licença

#####  Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## Contato
Se tiver dúvidas ou sugestões, entre em contato:

    Nome: [ Marcelo Deus ]

    Email: [ marcelodeus98@gmail.com ]

    GitHub: [ marcelodeus98 ]
