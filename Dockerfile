from ubuntu:precise

run apt-get -y update
run apt-get install -y curl build-essential

run curl -sSL https://rvm.io/mpapis.asc | gpg --import -

ENV PATH /usr/local/rvm/rubies/ruby-1.8.6-p420/bin:/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

run curl -L https://get.rvm.io | bash -s stable

run /usr/local/rvm/bin/rvm-shell && rvm requirements
run /usr/local/rvm/bin/rvm-shell && rvm install 1.8.6 
run /usr/local/rvm/bin/rvm-shell && rvm use 1.8.6 --default

ENV GEM_HOME /usr/local/rvm/rubies/ruby-1.8.6-p420/lib/ruby/gems/1.8
ENV GEM_PATH $GEM_HOME:/usr/local/rvm/rubies/ruby-1.8.6-p420/lib/ruby/gems/1.8

run apt-get -y install nginx
run gem install rake --version=10.1.0
run gem install passenger
run apt-get install -y libcurl4-openssl-dev
run apt-get install sudo
run passenger-install-nginx-module --auto
