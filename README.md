# Car Advertisement Web

## Requirements
 * Ruby version: 3.0.1
 * Rails: 7.0
 * Database: PostgreSQL

## How to install?
1. ```git clone https://github.com/Habovskyi/car_advertisements_web.git```
2. ```cd car_advertisements_web.git```
3. ```bundle install```
4. ```rails db:migrate```
5. ```rails s```

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
