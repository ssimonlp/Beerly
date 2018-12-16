# Beerly

(https://nsa39.casimages.com/img/2018/12/16/mini_181216051550199399.png)

Hi! you can find our project there https://thp-beerly.herokuapp.com/

Beerly is an application that help you find bars in Paris according to the brand or type of beer you want to drink.
for example if you are looking for a bar that serve Karmeliet just look it up in beerly and it will show you a map that show all the bar around you that serve Karmeliet.


# Installation Guide

To install and try our awesome project in local :

$ git clone https://github.com/Crysicia/THP-Movies.git
$ cd THP-Movie
$ bundle install
$ rails db:create
$ rake db:seed RAILS_ENV=test

Run it like this :
$ rails s

Then you can go to :
$ localhost:3000


## how does it work

To make our project work on rails we used differents gems :

-**devise** manage the users and managers identifications and connexion.

-**geocoder** Geocalise the user after  he searched for a beer and return his latitude and longitude for the map to work

-**mailjet** is used to send mail to our users after their created their account.

-**omniauth** allow the user to connect to beerly by his Facebook or google account. 
