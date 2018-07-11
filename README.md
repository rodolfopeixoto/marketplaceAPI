# Projeto MarketPlace API

Projeto é uma API com os aspectos principais de um marketplace!

========================================
- As ferramentas utilizadas nesse projeto:

 ```
  Rails 5
   gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
   gem 'pg', '~> 0.18'
   gem 'puma', '~> 3.0'

   gem 'rack-cors', :require => 'rack/cors'

   group :development, :test do
     # Call 'byebug' anywhere in the code to stop execution and get a debugger console
     gem 'byebug', platform: :mri
    gem 'factory_girl_rails'
    gem 'ffaker'
   end

   group :test do
    gem 'rspec-rails'
    gem 'shoulda-matchers'
    gem 'email_spec'
   end

   gem 'active_model_serializers', '~> 0.10.0'
   gem 'devise'
   gem 'kaminari'
   gem 'delayed_job_active_record'


  Docker

```

- Comandos Docker

- Stop container

  ```
    docker-compose stop $(docker ps -qf)

  ```

- To remove all containers that are NOT running

  ```
    docker rm `docker ps -aq -f status=exited`

  ```

- To list all running and stopped containers
    ```
      docker ps -a

    ```

- To list all running containers (just stating the obvious and also example use of -f filtering option)

    ```

      docker ps -a -f status=running

    ```
- To list all running and stopped containers, showing only their container id

    ```

      docker ps -aq

    ```
- List all name of all containers

    ```

      docker inspect --format='{{.Name}}' $(sudo docker ps -aq --no-trunc)

    ```
- Remove all images pendente

    ```
      docker rmi $(docker images -f dangling=true -q)

    ```

- One liner to stop / remove all of Docker containers:

          docker stop $(docker ps -a -q)
          docker rm $(docker ps -a -q)

- Verificando se está funcionando api

    ```
    curl -H 'Accept: application/vnd.marketplace.v1' http://api.market_place_api.dev/users/1
    ```

- Caso peça permissão de pasta basta colocar o comando no terminal

    ```
    sudo chown -R $USER:$USER .
    ```

- Configurar o active_model_serializers

    ```
    And configure Rails for JSON API serialization in two steps:

      Create an initializer at config/initializers/json_api.rb with the following code:

      ActiveSupport.on_load(:action_controller) do
      require 'active_model_serializers/register_jsonapi_renderer'
      end

      ActiveModelSerializers.config.adapter = :json_api
      ```



- Capítulo 7 error


        /config/initializers/serializer.rb
        ActiveModelSerializers.config.adapter = :json_api # Default: `:attributes`
        By default ActiveModelSerializers will use the Attributes Adapter (no JSON root). But we strongly advise you to use JsonApi Adapter, which follows 1.0 of the format specified in jsonapi.org/format.


        https://github.com/rails-api/active_model_serializers/blob/master/docs/general/adapters.md#advanced-adapter-configuration



#### Desenvolvendo APIS ON RAILS
================================

[APIonRails-IcaliaLabs](http://apionrails.icalialabs.com/)

O tutorial é muito bom, mas como já foi feita à tempo, tive que refazer algumas alterações para o modelo atual do framework Rails 5 --api e das gems!
