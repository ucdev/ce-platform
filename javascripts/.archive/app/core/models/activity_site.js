/*! app/models/activity_site 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_site
*/
define("app/models/Activity_site",function(require,app) {
	app.models.Activity_site = app.Model.extend({
			url: function() {
				base = "/api/activity_sites/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
