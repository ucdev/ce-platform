/*! app/models/activity_cdc 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_cdc
*/
define("app/models/Activity_cdc",function(require,app) {
	app.models.Activity_cdc = app.Model.extend({
			url: function() {
				base = "/api/activity_cdcs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
