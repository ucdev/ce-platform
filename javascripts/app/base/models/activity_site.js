/*! app/models/activity_site 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_site
*/
define("app/models/activity_site",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_siteModel = AppModel.extend({
		url: function() {
			base = "/api/activity_sites/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_siteModel)
});
