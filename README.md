
# Beerly

![Beerly logo](https://nsa39.casimages.com/img/2018/12/16/mini_181216051550199399.png)


Beerly is an application that helps you find bars in Paris according to the brand or type of beer you want to drink.  
For example if you are looking for a bar that serves Guiness just look it up on beerly and it will show you a map displaying all the bars around you serving Guiness.


## :wrench: Installation guide

    $ git clone https://github.com/ssimonlp/Beerly.git
    $ cd Beerly
    $ bundle install
    $ rails db:create db:migrate db:seed

### Credentials setup
Our credentials.yml has the following layout :

    google_maps: <key>
    
    mailjet:
      public_key: <key>
      secret_key: <key>
      
    brewery_db: <key>
    
    omniauth:
      google:
        client: <key>
        secret:<key>
      facebook:
        app_id: <key>
        secret: <key>

### Tests
You can run the tests on the test environement :

    $ rake db:seed RAILS_ENV=test
    $ rspec
([@AJuliette](https://github.com/AJuliette) : Next time I'll seed using FactoryBot ! ;) 
  
## :gem: Gems used 

> [**Devise**](https://github.com/plataformatec/devise) / Manage user logins/sessions.  
> [**Geocoder**](https://github.com/alexreisner/geocoder) / Geolocation util. Used to Geocode bar addresses.  
> [**Mailjet**](https://github.com/mailjet/mailjet-gem) / Used to deliver emails.  
> [**Omniauth**](https://github.com/omniauth/omniauth) / Allow users to login through other services.  
> -- [**Omniauth-facebook**](https://github.com/mkdynamic/omniauth-facebook) / Login via Facebook.  
> --  [**Omniauth-google-oauth2**](https://github.com/zquestz/omniauth-google-oauth2) / Login via Google.  
> [**Pg_search**](https://github.com/Casecommons/pg_search) / Full text search.  
> [**Httparty**](https://github.com/jnunemaker/httparty) / HTTP request util, used to scrap data from APIs.  
> [**jQuery-rails**](https://github.com/rails/jquery-rails) / Javascript libary, speed up dev time.  
> [**CSV**](https://github.com/ruby/csv) / CSV parser, used to seed our DB from CSV.  
> [**Pry-rails**](https://github.com/rweng/pry-rails) / Debugging tool, used to... well, debug.  
> [**Rspec-rails**](https://github.com/rspec/rspec-rails) / Testing framework, used to test our crappy associations ^^'

> [**Mailcatcher**](https://github.com/sj26/mailcatcher) / Send emails to a local smtp server in dev | Setup : `gem install mailcatcher` > `mailcatcher` > Go to `127.0.0.1:1080`

## :clapper: Where can I find the live website ?
 The live website lives here : [On Heroku](http://thp-beerly.herokuapp.com)

## :octopus: Who made this ?
### Front-end
:tada: Mathieu Maillet, the "I did it all by myself" boy ([@mathieumllt](https://github.com/mathieumllt))  
:hourglass: Louis Martin du Nord, the bar seeking dude ([@louismn](https://github.com/louismn))
### Back-end
:cat: juliette Audema, the Trello addict ([@AJuliette](https://github.com/AJuliette))  
:beer: Simon Le Pavec, the autocompletionist ([@ssimonlp](https://github.com/ssimonlp))  
:space_invader: Lucien Passera, the extreme debugger ([@Crysicia](https://github.com/Crysicia))
