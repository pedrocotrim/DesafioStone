# Desafio Stone

Essa é uma API desenvolvida em Ruby on Rails para a parte do desafio do processo seletivo para a Stone.  
A API pode ser testada em:
> https://desafio-stn-pedro-cotrim.herokuapp.com

## Endpoints
Para acessar os endpoints, é necessário que a requisição inclua um header chamado Authorization com um token válido.
Os tokens estão atrelados aos Centros de Custo e podem ser acessados no endpoint /login/:id, sendo :id o id do Centro de Custo.
A aplicação tem os seguintes endpoints:

#### GET
* ```ruby
  '/expenses' # Retorna todas as despesas
  '/expenses/:id' # Retorna a despesa com id igual ao fornecido
  ```
* ```ruby
  '/deliveries' # Retorna todas as entregas
  '/deliveries/:id' # Retorna a entrega com id igual ao fornecido
  ```
* ```ruby
  '/apps' # Retorna todas as aplicações e os centros de custo aos quais elas estão ligadas
  '/apps/:id' # Retorna a aplicação com id igual ao fornecido
  ```
* ```ruby
  '/cost_centers' # Retorna todos os centros de custo e suas aplicações
  '/cost_centers/:id' # Retorna o centro de custo com id igual ao fornecido
  ```
* ```ruby
  '/tracking/:id' # Utilizado para rastrear quais emails foram abertos
  '/emails' # Mostra todos os emails
  '/email_stats/:id' # Mostra as estatísticas para o email com o id informado
  ```

### POST
* ```ruby
  '/delivery_status' # Recebe uma requisição com o corpo abaixo e retorna o status da entrega
  {
    "tracking_id": '<id>'
  }
  ```
* ```ruby
  '/send_mail' # Recebe uma requisição com o corpo abaixo, envia o email e retorna o id de rastreamento
  {
    "email": {
      "sender": "<email do remetente>",
      "sender_name": "<nome do remetente>"
      "body": "<corpo em html do email>",
      "title": "<assunto do email>",
      "priority": "<prioridade do email>"
    },
    "recipients": "<lista de emails>"
  }
  ```
* ```ruby
  '/send_sms' # Recebe uma requisição com o corpo abaixo, envia o sms e retorna o id de rastreamento
  {
    "body": "<corpo do sms>",
    "recipients": "<lista de numeros de telefone"
  }
  ```