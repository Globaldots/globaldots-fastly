#!/bin/bash

# This script installs a new Wordpress service on your Fastly account. 
# prerequisites: jq (yum install jq) 
#
# usage: fastly-create-wp-service.sh <domain> <origin> 
# examples: fastly-create-wp-service.sh blog.mywebsite.com  origin.mydomain.com   
#           fastly-create-wp-service.sh blog.mywebsite.com  100.100.100.100  
    
YOUR_FASTLY_TOKEN=place-your-api-key-here

DOMAIN=$1 
ORIGIN=$2   
SERVICE_NAME=$DOMAIN
HOST_HEADER_TO_ORIGIN=$DOMAIN
TTL=3600
ORIGIN_PORT=80

FASTLY_API=https://api.fastly.com


# Create new service and get service id
SERVICEID=`curl $FASTLY_API/service -X POST -d "name=$SERVICE_NAME" -H "Fastly-Key: $YOUR_FASTLY_TOKEN"  -H "Accept: application/json" | jq -r ".id"`
echo Service id = $SERVICEID

# add domain 
curl -s $FASTLY_API/service/$SERVICEID/version/1/domain -X POST -d "name=$DOMAIN" -H "Fastly-Key: $YOUR_FASTLY_TOKEN"  -H "Accept: application/json" | jq "."

# add origin 
curl -s $FASTLY_API/service/$SERVICEID/version/1/backend -X POST -d "address=$ORIGIN" -d "name=origin_$ORIGIN" -d "port=$ORIGIN_PORT" -H "Fastly-Key: $YOUR_FASTLY_TOKEN"  -H "Accept: application/json" | jq "."

# default host name and TTL
curl -s $FASTLY_API/service/$SERVICEID/version/1/settings -X PUT -d "general.default_ttl=$TTL" -d "general.default_host=$HOST_HEADER_TO_ORIGIN" -H "Fastly-Key: $YOUR_FASTLY_TOKEN"  -H "Accept: application/json"  | jq "."

# condition for wordpress admin
curl -s $FASTLY_API/service/$SERVICEID/version/1/condition -X POST -d "type=cache" -d "name=wp-admin" --data-urlencode 'statement=req.url ~ "wp-(login|admin)" || req.http.cookie ~ "wordpress_logged_in"' -d "priority=10" -H "Fastly-Key: $YOUR_FASTLY_TOKEN"  -H "Accept: application/json"  | jq "."

# disable cache if wordpress admin 
curl -s $FASTLY_API/service/$SERVICEID/version/1/cache_settings -X POST -d "name=wordpress" -d "stale_ttl=0" -d "ttl=0" -d "action=pass" -d "cache_condition=wp-admin" -H "Fastly-Key: $YOUR_FASTLY_TOKEN"  -H "Accept: application/json"  | jq "."

# enable default gzip for service 
curl -s $FASTLY_API/service/$SERVICEID/version/1/gzip -X POST -d "name=default gzip" -H "Fastly-Key: $YOUR_FASTLY_TOKEN"  -H "Accept: application/json"  | jq "."

# activate service 
curl -s $FASTLY_API/service/$SERVICEID/version/1/activate -X PUT -H "Fastly-Key: $YOUR_FASTLY_TOKEN"  -H "Accept: application/json" | jq "."
