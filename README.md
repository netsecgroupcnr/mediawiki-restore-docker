# mediawiki-restore-docker

Quickly restore MediaWiki installations locally

### Instructions ###

TODO

#### Script configuration ####

Configure the `IP` variable to match your local IP address.
Note that `127.0.0.1` or `localhost` are not valid values.
Instead, values like your IP address on the current LAN network is accepted.

TODO update database data on docker-compose

#### MediaWiki configuration ####

Access your current/live MediaWiki host and add at the beggining of `LocalSettings.php`:
```
error_reporting( -1 );
ini_set( 'display_errors', 0 );
$wgDevelopmentWarnings = false;
```

#### Backup configuration ####

Backup files TODO

### Execution ###

1. Put SQL and `www-data` files, both zipped, into the `input` folder
2. Run `sh prepare.sh`
3. Run `docker-compose up -d`
4. Access http://localhost:8080

TODO
