# Rails Docker Boilerplate

## System Configuration

| Item                          | Content                                      |
|------------------------------ |----------------------------------------------|
| Framework                     | Ruby on Rails 5.2.0                          |
| Ruby Version                  | 2.5.1                                        |
| Database                      | MySQL 5.7.22                                 |
| API Document                  | Swagger(OpenAPI 2.0)                         |
| Required Middleware           | Docker version 18.03.0-ce                    |


## Getting Started

```bash
# Clone
https://github.com/ujway/rails-docker-boilerplate.git
cd rails-docker-boilerplate

# Docker container create, install bundle and run a rails server
docker -v # out> Docker version 17.12.0-ce, build c97c6d6
docker-compose build
docker-compose up -d

# Setup rails database
docker-compose exec web ruby -v # out> ruby 2.5.0p0 ...
docker-compose exec web rails -v # out> Rails 5.1.5
docker-compose exec web rails db:create
docker-compose exec web rails db:migrate

#### Remove all containers and images defined in docker-compose
# docker-compose down -v --rmi all
```

## License
This software is released under the MIT License, see LICENSE.txt.
