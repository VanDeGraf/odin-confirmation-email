## Confirmation email
This project is part of [The Odin Project Curriculum](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/sending-confirmation-emails)

### Description

_I simplified the task a little by composing it like this:_  

Create a form with an email, upon sending a confirmation link, by clicking on which the user would be shown a message about the successful verification of the email authenticity.

### Requirements
* gems:
    * **rails** >= 6
    * **figaro**

### Installation
1. clone repo
1. `cd` into directory
1. exclude production gems with `bundle config set --local without production`
1. run `bundle`
1. migrate database with run `rails db:migrate`

### Running
 `rails s` to start server

### Deployment

#### Configuration production environment:
  * `config/environments/production.rb`
    * set configuration of your mail provider in `config.action_mailer.smtp_settings` hash
  * `config/application.yml` (create if not exists)
    * `production:` `host:` remote hostname
    * `production:` `email:` from send email
    * other secure params, like mail login, password etc
    
#### Deployment to Heroku
  1. `heroku create` create new heroku app
  2. `git push heroku main` deploy on heroku
  3. `heroku run rails db:migrate` install heroku database and migrate
  4. `figaro heroku:set -e production` set production environment variables to heroku app

### About mail provider

After 3 unsuccessful attempts to create a SendGrid account for Heroku with varying degrees of success, 
I began to figure out why this addon is needed, and realized that there was no obvious need for it to 
simply send text emails. Sufficient functionality is already in the rails, you just need to specify 
the correct parameters of the smtp server of the selected mail provider. At first I tried to use Yahoo, 
but getting a little lost in search of their mail api, I decided to change to a more familiar local analogue 
to me - Yandex, the parameters of which were easier for me to find. I suppose, with the correct configuration 
of `config.action_mailer.smtp_settings`, you can use any available mail provider. 