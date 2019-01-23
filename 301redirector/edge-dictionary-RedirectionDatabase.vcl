# This dictionary is to be used when you need to override response's Content-Type
# Usage instructions: 
#    In the Fastly console, create a Header rule
#       Header type/action: Response
#       Destination:        http.Location
#       Source:             table.lookup(RedirectionDatabase, req.url, var.default301)


# declare local var.default301 STRING;
# set var.default301 = "https://support.globaldots.com/hc/en-us";

table RedirectionDatabase {
        "/knowledgebase.php?action=displayarticle&id=57" : "https://support.globaldots.com/hc/en-us/articles/360020120431",
        "/knowledgebase.php?action=displayarticle&id=4"  : "https://support.globaldots.com/hc/en-us/articles/360020120631",
        "/knowledgebase.php?action=displayarticle&id=39" : "https://support.globaldots.com/hc/en-us/articles/115004003429-Akamai-How-to-set-up-Alerts",
        "/knowledgebase.php?action=displayarticle&id=16" : "https://support.globaldots.com/hc/en-us/articles/115003996705-Akamai-Pragma-Headers-overview",
        "/knowledgebase.php?action=displayarticle&id=44" : "https://support.globaldots.com/hc/en-us/articles/115003996725-Akamai-Purge-via-API",
        "/knowledgebase.php?action=displayarticle&id=32" : "https://support.globaldots.com/hc/en-us/articles/115003996745-Akamai-Server-caching-behavior-related-to-Vary-headers-from-the-Origin-Server",
        "/knowledgebase.php?action=displayarticle&id=48" : "https://support.globaldots.com/hc/en-us/articles/115003996785-Akamai-The-difference-between-CCU-purging-and-ECCU-refreshing-content",
        "/knowledgebase.php?action=displayarticle&id=38" : "https://support.globaldots.com/hc/en-us/articles/115004003449-Akamai-Unable-to-enable-Real-User-Monitoring-from-Configuration-Manager-UI",
        "/knowledgebase.php?action=displayarticle&id=25" : "https://support.globaldots.com/hc/en-us/articles/115003996825-Akamai-Using-ESN-or-Akamai-s-Edge-Staging-Network",
        "/knowledgebase.php?action=displayarticle&id=37" : "https://support.globaldots.com/hc/en-us/articles/115004003469-Akamai-Traffic-Report-VS-Usage-Report",
        "/knowledgebase.php?action=displayarticle&id=59" : "https://support.globaldots.com/hc/en-us/articles/115004003529-Akamai-Cloud-Monitor-does-not-send-data",
        "/knowledgebase.php?action=displayarticle&id=49" : "https://support.globaldots.com/hc/en-us/articles/360019894492",
        "/knowledgebase.php?action=displayarticle&id=15" : "https://support.globaldots.com/hc/en-us/articles/360020119691",
        "/knowledgebase.php?action=displayarticle&id=58" : "https://support.globaldots.com/hc/en-us/articles/115003994885-Current-IAM-policy",
        "/knowledgebase.php?action=displayarticle&id=24" : "https://support.globaldots.com/hc/en-us/articles/115003996065-Dyn-Change-the-contact-details-for-a-zone",
        "/knowledgebase.php?action=displayarticle&id=56" : "https://support.globaldots.com/hc/en-us/articles/115003996085-Dyn-Dynamic-DNS-records",
        "/knowledgebase.php?action=displayarticle&id=3"  : "https://support.globaldots.com/hc/en-us/articles/115004002829-Dyn-How-to-get-all-records-from-a-zone-through-the-API",
        "/knowledgebase.php?action=displayarticle&id=23" : "https://support.globaldots.com/hc/en-us/articles/115004002849-Dyn-HTTP-Redirection-of-zone-apex",
        "/knowledgebase.php?action=displayarticle&id=22" : "https://support.globaldots.com/hc/en-us/articles/115003996185-Dyn-Performance-Health-Monitoring-Addresses",
        "/knowledgebase.php?action=displayarticle&id=42" : "https://support.globaldots.com/hc/en-us/articles/115004002929-Dyn-Read-Only-user",
        "/knowledgebase.php?action=displayarticle&id=19" : "https://support.globaldots.com/hc/en-us/articles/115003996985-Edgecast-301-or-302-redirection-from-cache",
        "/knowledgebase.php?action=displayarticle&id=9"  : "https://support.globaldots.com/hc/en-us/articles/115004003669-EdgeCast-Adding-a-new-user-for-Purge-Only",
        "/knowledgebase.php?action=displayarticle&id=46" : "https://support.globaldots.com/hc/en-us/articles/115004003689-Edgecast-Advanced-Rules-Engine",
        "/knowledgebase.php?action=displayarticle&id=17" : "https://support.globaldots.com/hc/en-us/articles/115004003749-Edgecast-Allowing-API-access",
        "/knowledgebase.php?action=displayarticle&id=45" : "https://support.globaldots.com/hc/en-us/articles/115003997145-Edgecast-Create-alert-on-traffic-anomalies",
        "/knowledgebase.php?action=displayarticle&id=41" : "https://support.globaldots.com/hc/en-us/articles/115004003849-Edgecast-IP-addresses",
        "/knowledgebase.php?action=displayarticle&id=11" : "https://support.globaldots.com/hc/en-us/articles/115003997185-EdgeCast-Override-origin-cache-control",
        "/knowledgebase.php?action=displayarticle&id=27" : "https://support.globaldots.com/hc/en-us/articles/115004003889-Edgecast-Purging-via-API",
        "/knowledgebase.php?action=displayarticle&id=18" : "https://support.globaldots.com/hc/en-us/articles/115003997305-Edgecast-Setting-up-SSL",
        "/knowledgebase.php?action=displayarticle&id=52" : "https://support.globaldots.com/hc/en-us/articles/115003997325-Edgecast-Small-vs-Large",
        "/knowledgebase.php?action=displayarticle&id=7"  : "https://support.globaldots.com/hc/en-us/articles/115003997345-EdgeCast-Starting-with-your-new-account",
        "/knowledgebase.php?action=displayarticle&id=26" : "https://support.globaldots.com/hc/en-us/articles/115003997365-Edgecast-Understanding-default-cache-TTL",
        "/knowledgebase.php?action=displayarticle&id=63" : "https://support.globaldots.com/hc/en-us/articles/115004003569-Enable-HTTP-verbs-PUT-DELETE-etc-",

        "/knowledgebase.php?action=displayarticle&id=40" : "https://support.globaldots.com/hc/en-us/articles/360020118071",
        "/knowledgebase.php?action=displayarticle&id=5"  : "https://support.globaldots.com/hc/en-us/articles/360019893392",
        "/knowledgebase.php?action=displayarticle&id=8"  : "https://support.globaldots.com/hc/en-us/articles/360019893652",
        "/knowledgebase.php?action=displayarticle&id=64" : "https://support.globaldots.com/hc/en-us/articles/360019893892",
        "/knowledgebase.php?action=displayarticle&id=13" : "https://support.globaldots.com/hc/en-us/articles/360019894072",
        "/knowledgebase.php?action=displayarticle&id=12" : "https://support.globaldots.com/hc/en-us/articles/360020119351",
        "/knowledgebase.php?action=displayarticle&id=54" : "https://support.globaldots.com/hc/en-us/articles/360020113931",
        "/knowledgebase.php?action=displayarticle&id=51" : "https://support.globaldots.com/hc/en-us/articles/360020115731",
        "/knowledgebase.php?action=displayarticle&id=47" : "https://support.globaldots.com/hc/en-us/articles/360019891372",


        "/knowledgebase.php?action=displayarticle&id=2" : "https://support.globaldots.com/hc/en-us/articles/115003997525-ICP-License",
        "/knowledgebase.php?action=displayarticle&id=53" : "https://support.globaldots.com/hc/en-us/articles/360019888392",

        "/knowledgebase.php?action=displayarticle&id=55" : "https://support.globaldots.com/hc/en-us/articles/115003996245-NSONE-creating-geo-resolution-records",
        "/knowledgebase.php?action=displayarticle&id=30" : "https://support.globaldots.com/hc/en-us/articles/115004003589-Prefetching-Prefetchable",
        "/knowledgebase.php?action=displayarticle&id=69" : "https://support.globaldots.com/hc/en-us/articles/115004036909-Simple-serverless-redirecting-of-your-root-domain",
        "/knowledgebase.php?action=displayarticle&id=66" : "https://support.globaldots.com/hc/en-us/articles/360019897212",
        "/knowledgebase.php?action=displayarticle&id=67" : "https://support.globaldots.com/hc/en-us/articles/115004003609-Staging-with-ChinaCDN",

        "/knowledgebase.php?action=displayarticle&id=62" : "https://support.globaldots.com/hc/en-us/articles/360020119411",
        "/knowledgebase.php?action=displayarticle&id=31" : "https://support.globaldots.com/hc/en-us/articles/115003996945-What-is-the-Akamai-Log-Delivery-Service-LDS-How-do-I-enable-it-",
        "/knowledgebase.php?action=displayarticle&id=36" : "https://support.globaldots.com/hc/en-us/articles/115003996965-Wildcard-in-expressions-won-t-work"
}