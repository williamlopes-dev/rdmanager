rdmanager
=========

This project was developed using ruby v2.4.2 and rails v5.1.5 in a fresh ubuntu v16.04.3 installation. Please follow the step by step to prepare your environment.

#### First at all, update your system
```shell
$ sudo apt update
$ sudo apt upgrade
```

#### Install necessary softwares
```shell
$ sudo apt install curl git postgresql postgresql-contrib libpq-dev nodejs chromium-browser
```

#### Install latest rvm stable version
```shell
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
$ \curl -sSL https://get.rvm.io | bash -s stable
$ echo 'export PATH="$PATH:$HOME/.rvm/bin"' >> ~/.bashrc
$ source ~/.bashrc
```

#### Install ruby v2.4.2 and rails v5.1.5
```shell
$ rvm install 2.4.2
$ rvm alias create default 2.4.2
$ rvm list #check default version
$ /bin/bash --login
$ gem install rails --version 5.1.5
```

#### Create and configure your workspace
```shell
$ mkdir Workspace
$ cd Workspace
$ wget https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip
$ unzip chromedriver_linux64.zip
$ sudo ln -s $HOME/Workspace/chromedriver /usr/local/bin/chromedriver
```

#### Clone the repository rdmanger from github
```shell
$ git clone https://github.com/williamlopes-dev/rdmanager.git
```

#### Prepare your development environment
```shell
$ cd rdmanager
$ bundle install
$ sudo -u postgres psql postgres
$ \password postgres
# type your password and put them in config/database.yml
# add `postgres` username to config/database.yml
$ \q # to exit
$ rake db:create
$ rake db:migrate
```

#### Run rails server
```shell
$ rails server
```

#### Run tests
```shell
$ rake test
$ rake test:system
```

#### REST
> API documentation is hosted on `https://documenter.getpostman.com/view/3807034/rdmanager-api/RVg3eTFU`
