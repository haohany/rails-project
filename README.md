##Demo
https://rails-haohan.herokuapp.com

username: *admin*

password: *admin*

##Local Set Up
* `git clone https://github.com/haohany/rails-project.git`
* `cd rails-project`
* `bundle install --without production`
* `rake db:migrate`
* `rake seed:all`
* `rails c` open rails console, `Admin.create(username: 'admin', password: 'admin')` create an Admin user to log in, then `exit`
* `rails s` start server

##TODO
* Create tests
* ~~N+1 queries issue~~
