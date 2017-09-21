# Various helper scripts for Fastly management

## Wordpress support
All Wordpress sites need settings to not cache administrative and editor pages. 
The `fastly-create-wp-service.sh` script creates a new WP site with all required settings. 

## Fixing Content-Type
Content often comes from the origin with the wrong content type headers. Instead of creating custom rules for each content type, use an edge dictionary to mainain a list of content types to override by file extension. 
The edge dictionary is managed as a VCL snippet, so you can have a list like the one below. A full list is in file `edge-dictionary-ContentTypes.vcl` 
````
table ContentTypes {
		"3dml"   :   "text/vnd.in3d.3dml",
		"3g2"   :   "video/3gpp2",
		"3gp"   :   "video/3gpp",
		"7z"   :   "application/x-7z-compressed",
		"aab"   :   "application/x-authorware-bin",
		"aac"   :   "audio/x-aac",
		"h261"   :   "video/h261",
		"h263"   :   "video/h263",
		"h264"   :   "video/h264",
		"jnlp"   :   "application/x-java-jnlp-file",
		"jpeg"   :   "image/jpeg",
		"woff"   :   "application/x-font-woff",
		"xls"   :   "application/vnd.ms-excel",
		"xlsb"   :   "application/vnd.ms-excel.sheet.binary.macroenabled.12",
		"xlsm"   :   "application/vnd.ms-excel.sheet.macroenabled.12",
		"xlsx"   :   "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
		"xltm"   :   "application/vnd.ms-excel.template.macroenabled.12",
		"xltx"   :   "application/vnd.openxmlformats-officedocument.spreadsheetml.template",
		"yaml"   :   "text/yaml",
		"zip"   :   "application/zip"
	}
````

You will refer to it in the Fastly configuration by adding a Header rule: 
* Header type/action: Response
* Destination:        `http.Content-Type`
* Source:             `table.lookup(ContentTypes, req.url.ext, resp.http.Content-Type)`
