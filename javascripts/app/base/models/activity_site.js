/*! app/models/activity_site 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_site
*/
define("app/models/activity_site",["require","app"],function(require,app) {
	var Activity_siteModel = app.Model.extend({
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
