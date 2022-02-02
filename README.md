# Car Advertisement Web

## Project description
Car Adwertisment - car ad service. Here you can see a list of cars. You can also find a car using the characteristics of cars. Registered users have a search history option.

## Requirements
 * Ruby version: 3.0.1
 * Rails: 7.0
 * Database: PostgreSQL

## How to install?
1. ```cd car_advertisements_web```
2. ```git clone https://github.com/Habovskyi/car_advertisements_web.git```
3. ```bundle install```
4. ```rails db:create```
5. ```rails db:migrate```
6. ```rails s```

## Rake
To fill the database of cars created a rake task.

```rails car:create[count]```, where ```count``` - number cars.

## Heroku
Deployed the project on Heroku
[Car Advertisements](https://caradvertisement.herokuapp.com/)
## What implemented?
* Rake task
* Devise Auth
* Rubocop
* Fasterer
* Overcommit
* Circle CI/CD
* Heroku
