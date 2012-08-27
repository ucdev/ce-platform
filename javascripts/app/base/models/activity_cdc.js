/*! app/models/activity_cdc 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_cdc
*/
define("app/models/activity_cdc",["require","app"],function(require,app) {
	var Activity_cdcModel = app.Model.extend({
		url: function() {
			base = "/api/activity_cdcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_cdcModel)
});
