# README

## Ruby version
- ruby:2.4

## System dependencies
> **Note**
> It is suggested to use Docker and Docker-compose to run the App

1. [Docker](https://www.docker.com/)
2. [Docker-Compose](https://www.docker.com/)
3. [nodejs](https://nodejs.org/en/)
4. [imagemagick](https://github.com/rmagick/rmagick)

## Configuration
- Stripe: Use environment variables to setup your credentials:
    - PUBLISHABLE_KEY
    - SECRET_KEY

- Database: If *NOT* using Docker/Docker-Compose, these libraries need to be installed:
    - sqlite3
    - nodejs 
    - imagemagick 
    - libmagickwand-dev 
    - rails bundler
    - mysql (optional)
    > *NOTE* 
    > mysql can be used but will need manual configuration 
    > and update used driver/connection in `database.yml`

- Optional (Using Docker/Docker-Compose):
    Use an `.env` file or the following system environment variables for the database credentials:
        - MYSQL_USER
        - MYSQL_PASSWORD
        - MYSQL_ROOT_PASSWORD
    > *they are currently hard coded in the `docker-compose` file*

## Database creation
    - Docker: 
        - The database should be done automatically created if using docker-compose

    - Without Docker:
        - sqlite3: use provided sqlite3 file in `/db` folder
        - mysql: use cli
            ```bash
            rake db:create
            ```

## Database initialization
    - Docker: 
        - The database migration should be done automatically if using docker-compose
        - The database seed should be done automatically if using docker-compose

    - Without Docker:
        - migrate:
            ```bash
            rake db:migrate
            ```
        - seed:
            ```bash
            rake db:seed
            ```
        > *NOTE*: comment/uncomment desired functions on seeds.rb file in the EXEC section

## Run App
    - Docker-Compose (Prefered):
        ```bash
        docker-compose up
        ```
        > *NOTE* use `-d` if you want the cluster to run in the background

    - Docker:
        > A docker image can be built using the Dockerfile and then run
        ```bash
        docker build -t kcommerce:latest .
        ```
        ```bash
        docker run --name kcommerce -d -p 80:80 mgkeiji/kcommerce
        ```
        - share volume for development
        ```bash
        docker run --name kcommerce -d -p 80:80 -v "$PWD:/myapp" mgkeiji/kcommerce
        ```

    - Without Docker:
        > Just run the rails server
        ```bash
        bin/rails server
        ```

## Troubleshoot
### Car image path
- Problem: The car images might not get populated during the `rails db:seed` process:
- Solution: Manually login as [admin](http://localhost/admin), 
    go to the car tab and manually upload all the images.
