# mediawiki-restore-docker

Quickly restore [MediaWiki](https://www.mediawiki.org) installations locally

### Introduction ###

This [Docker](https://www.docker.com) container allows you to restore a [MediaWiki](https://www.mediawiki.org) installation on your local machine.
This can be useful to access your [MediaWiki](https://www.mediawiki.org) installation from backup files, for instance, if the original installation is temporarly not available (e.g. due to a network issue).

### Preliminary configuration ###

If you intend to use this software, you have to configure your running [MediaWiki](https://www.mediawiki.org) system accordingly.

#### MediaWiki configuration ####

Access your live [MediaWiki](https://www.mediawiki.org) host and add at the beggining of `LocalSettings.php`:
```
error_reporting(-1);
ini_set('display_errors', 0);
$wgDevelopmentWarnings = false;
```

#### Backup configuration ####

Concerning the running host, it is needed to back up:
* the `DocumentRoot` folder of the [MediaWiki](https://www.mediawiki.org) installation (for instance, through `cron`)
* the MySQL database used by [MediaWiki](https://www.mediawiki.org) (for instance, through [AutoMySQLBackup](https://sourceforge.net/projects/automysqlbackup/))

### Instructions ###

If follows instructions on how to set up the restore process.

#### Script configuration ####

1. Configure the `IP` variable on [prepare.sh](https://github.com/netsecgroupcnr/mediawiki-restore-docker/blob/9bd97ac6681a7abddf370fbe09fceef74cc91b7e/prepare.sh#L3) to match your local IP address.
Note that `127.0.0.1` or `localhost` are not valid values.
Instead, values like your IP address on the current LAN network is accepted.
2. Configure `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_ROOT_PASSWORD`, `MYSQL_DATABASE` values on [docker-compose.yaml](https://github.com/netsecgroupcnr/mediawiki-restore-docker/blob/master/docker-compose.yaml) to reflect your [MySQL](https://www.mysql.com) installation used by [MediaWiki](https://www.mediawiki.org)

### Execution ###

1. Create the `input` folder on the repository root folder
2. Put backup SQL zipped file into the `input` folder and name it as `*.sql.zip`
3. Put `www-data` zipped backup into the `input` folder and name it `data.zip` (note that the ZIP file is expected to include a `data` folder, including all files in the `DocumentRoot`)
4. Run `sh prepare.sh`
5. Run `docker-compose up -d`
6. Access http://localhost:8080
7. Optionally, it's possible to access [Adminer](https://www.adminer.org) at http://localhost:5000

### License ###

The program is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/).

### Contacts ###

This program is implemented by the [NetSec group of CNR-IEIIT](http://www.netsec.ieiit.cnr.it).
