#!/bin/bash

# prerequisites: jq (yum install jq) 
#
# usage: fastly-create-wp-service.sh <domain> <origin> 
# examples: fastly-create-wp-service.sh blog.mywebsite.com  origin.icepop.com   
#           fastly-create-wp-service.sh blog.mywebsite.com  100.100.100.100  
    
USER=someuser@somedomain.com
PASSWORD=mysecretpassword

DOMAIN=$1 
SERVICE_NAME=$DOMAIN
ORIGIN=$2   
HOST_HEADER_TO_ORIGIN=$DOMAIN
TTL=3600
ORIGIN_PORT=80

FASTLY_API=https://api.fastly.com

# remove previous fastly session 
yes | rm fastly.session 

# Get new session 
curl -s $FASTLY_API/login -X POST -d "user=$USER" -d "password=$PASSWORD" -H "Accept: application/json" --cookie-jar fastly.session  | jq "."

# Create new service and get service id

SERVICEID=`curl $FASTLY_API/service -X POST -d "name=$SERVICE_NAME" --cookie fastly.session  -H "Accept: application/json" | jq -r ".id"`

echo Service id = $SERVICEID

# add domain 
curl -s $FASTLY_API/service/$SERVICEID/version/1/domain -X POST -d "name=$DOMAIN" --cookie fastly.session  -H "Accept: application/json" | jq "."

# add origin 
curl -s $FASTLY_API/service/$SERVICEID/version/1/backend -X POST -d "address=$ORIGIN" -d "name=origin_$ORIGIN" -d "port=$ORIGIN_PORT" --cookie fastly.session  -H "Accept: application/json" | jq "."

# default host name and TTL
curl -s $FASTLY_API/service/$SERVICEID/version/1/settings -X PUT -d "general.default_ttl=$TTL" -d "general.default_host=$HOST_HEADER_TO_ORIGIN" --cookie fastly.session  -H "Accept: application/json"  | jq "."

# condition for wordpress admin
curl -s $FASTLY_API/service/$SERVICEID/version/1/condition -X POST -d "type=cache" -d "name=wp-admin" --data-urlencode 'statement=req.url ~ "wp-(login|admin)" || req.http.cookie ~ "wordpress_logged_in"' -d "priority=10" --cookie fastly.session  -H "Accept: application/json"  | jq "."

# disable cache if wordpress admin 
curl -s $FASTLY_API/service/$SERVICEID/version/1/cache_settings -X POST -d "name=wordpress" -d "stale_ttl=0" -d "ttl=0" -d "action=pass" -d "cache_condition=wp-admin" --cookie fastly.session  -H "Accept: application/json"  | jq "."

# enable default gzip for service 
curl -s $FASTLY_API/service/$SERVICEID/version/1/gzip -X POST -d "name=default gzip" --cookie fastly.session  -H "Accept: application/json"  | jq "."

# activate service 
curl -s $FASTLY_API/service/$SERVICEID/version/1/activate -X PUT --cookie fastly.session  -H "Accept: application/json" | jq "."

