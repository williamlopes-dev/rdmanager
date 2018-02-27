# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

h1. This project was developed using ruby v2.4.2 and rails v5.1.5 in a fresh ubuntu v16.04.3 installation. Please follow the step by step to prepare your environment.
. First at all, update your system
''' sudo apt update '''
''' sudo apt upgrade '''

. Install necessary softwares
''' sudo apt install curl git postgresql postgresql-contrib libpq-dev nodejs chromium-browser'''

. Lets install ruby using rvm software
''' gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB '''
''' \curl -sSL https://get.rvm.io | bash -s stable '''
''' echo 'export PATH="$PATH:$HOME/.rvm/bin"' >> ~/.bashrc '''
''' source ~/.bashrc '''
''' rvm install 2.4.2 '''
''' rvm alias create default 2.4.2 '''
''' rvm list '''
''' /bin/bash --login '''
''' gem install rails --version 5.1.5 '''
''' mkdir Workspace '''
''' cd Workspace '''
''' wget https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip '''
''' unzip chromedriver_linux64.zip '''
''' sudo ln -s $HOME/Workspace/chromedriver /usr/local/bin/chromedriver '''
''' git clone git@github.com:williamlopes-dev/rdmanager.git '''
''' cd rdmanager '''
''' bundle install '''
''' sudo -u postgres psql postgres '''
''' \password postgres '''
''' \q ''' to exit
type your password and put them in config/database.yml
''' rake db:create '''
''' rake db:migrate '''
''' rails server '''
''' rake test '''
''' rake test:system '''
