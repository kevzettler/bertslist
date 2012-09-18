# BertsList
Standard rails app

## Install
```bash
   git clone git@github.com:kevzettler/bertslist.git;
   cd bertslist;
   rvm use 1.9.3@bertslist; ## only if you using rvm
   bundle install;
   # need to add a database.yml file to config/database.yml
   bundle exec rake db:create db:migrate;
   bundle exec rails s #runs server
```

```yaml
# Database.yml
test:
  # Postgresql settings
  adapter: postgresql
  database: bertslist_test
  pool: 5
  tiemout: 5000

development:
  # Postgresql settings
  adapter: postgresql
  database: bertslist_development
  pool: 5
  tiemout: 5000

profile:
  # Postgresql settings
  adapter: postgresql
  database: bertslist_development
  pool: 5
  tiemout: 5000

production:
  # Postgresql settings
  adapter: postgresql
  database: bertslist_production
  pool: 5
  tiemout: 5000
```
   
