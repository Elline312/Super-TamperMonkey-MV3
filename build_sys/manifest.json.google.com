{
   "manifest_version": 3,
   "content_security_policy": "script-src 'self'; object-src 'self'",
   "minimum_chrome_version": "121.0.0.0",
   "content_scripts": [ {
      "js": [ "registry.js",
              "convert.js",
              "helper.js",
              "xmlhttprequest.js",
	      "emulation.js",
	      "jslint.js",
	      "environment.js",
              "content.js" ],
      "matches": [ "file://*", "http://*/*", "https://*/*" ],
      "run_at": "document_start",
      "all_frames": true
   } ],
   "browser_action": {
      "default_icon": "images/icon_grey.png",
      "default_title": "Super Tampermonkey MV3",
      "default_popup": "action.html"
   },
   "icons": { "32": "images/icon.png",
   	      "48": "images/icon48.png",
       	     "128": "images/icon128.png" },
   "name": "Super Tampermonkey MV3",
   "version": "1.0.0",
   "description": "the most popular userscript manager for Google Chrome",
   "default_locale": "en",
   "background": {
       "page": "background.html"
   },
   "options_page": "options.html",
   "permissions": [ "notifications", 
                    "unlimited_storage", 
                    "tabs", 
                    "management", 
                    "webNavigation", 
                    "webRequest", "webRequestBlocking",
                    "<all_urls>" ],
   "optional_permissions" : [ "contentSettings", "storage" ]
}
