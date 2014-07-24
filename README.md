# MyApnea.org

[![Build Status](https://travis-ci.org/pmanko/www.myapnea.org.png?branch=master)](https://travis-ci.org/pmanko/www.myapnea.org)
[![Dependency Status](https://gemnasium.com/pmanko/www.myapnea.org.png)](https://gemnasium.com/pmanko/www.myapnea.org)
[![Code Climate](https://codeclimate.com/github/pmanko/www.myapnea.org.png)](https://codeclimate.com/github/pmanko/www.myapnea.org)

A patient-powered research network web application for sleep apnea patients: [www.myapnea.org](www.myapnea.org).

## Installation


```
gem install bundler
```

```
cd /var/www

git clone https://github.com/pmanko/www.myapnea.org

cd www.myapnea.org

bundle install
```

Install default configuration files for database connection, email server connection, server url, and application name.

```
ruby lib/initial_setup.rb

bundle exec rake db:migrate RAILS_ENV=production

bundle exec rake assets:precompile RAILS_ENV=production
```

Run Rails Server (or use Apache or nginx)

```
rails s -p80
```

Open a browser and go to: [http://localhost](http://localhost)

All done!

## Contributing to MyApnea

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
- Fork the project
- Start a feature/bugfix branch
- Commit and push until you are happy with your contribution
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

