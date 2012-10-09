# BertsList
Standard rails app

```bash
  git clone git@github.com:kevzettler/bertslist.git;
  cd bertslist;
```

## Install
Copy this to config/database.yml

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

Assuming that you are in the bertslist project directory. Run the bootstrap script

```bash
script/bootstrap
```
   
