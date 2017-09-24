# Various helper scripts for Fastly management

## Wordpress support in Fastly
All Wordpress sites need settings to not cache administrative and editor pages. 
The `fastly-create-wp-service.sh` script does everything you need to define a new WP site with all required settings. 
* add domain 
* add origin 
* default host name and TTL
* condition for wordpress admin
* disable cache if wordpress admin 
* enable default gzip for service 
* activate service 

## Prerequisites
You need an API key, and the `jq` tool. 