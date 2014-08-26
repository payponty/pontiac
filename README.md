# Pontiac

[![Gem Version](https://badge.fury.io/rb/pontiac.png)](http://badge.fury.io/rb/pontiac)

Gem engine for applications in the system PayPonty

## Install

    $ echo "gem 'pontiac'" >> Gemfile
    $ bundle

## Step 1

    $ rails g pontiac client_id client_secret
    $ bundle exec rake db:create db:migrate 

## Step 2

Edit `config/app_secret_config.yml`

    defaults: &defaults
      oauth:
        client_id: 'dffd069fa92096022628a1f7eb174bc85d90278b8c90ec7ebadfbd94924bd2b8'
        secret: 'e1805141c81c496e4779371f41263c9f74ac2ffd3728302296b8af10b64d9c9b'
        scope: 'read_products read_orders'
        redirect_uri: '/callback'

## Step 3

Start server

    $ rails s

[http://localhost:3000](http://localhost:3000)
