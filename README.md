# Ruby CQRS example with rom and dry-system

## Motivation

## Architecture

Image will be here soon

## List of services

### Users service 
* CQRS: one relation DB. 
* Kafka: no consumers, producer for `user_created` event
* Sync communications: zero

### Posts service 
* CQRS: two relation DB (one for write, one for read)
* Kafka: consumers for `users`, `posts` and `comments` topics, producer for `post_created` event
* Sync communications: zero

### Comments service 
* CQRS: two relation DB (one for write, one for read)
* Kafka: consumer for `comments` topic, producer for `comment_created` event
* Sync communications: one http call for getting user full name for read model

## Service implementation

Each service use rom for persistance, sitantra as a HTTP transport, dry-system as a dependency managment system

* `web_app.rb` - sintatra application with list of endpoints

