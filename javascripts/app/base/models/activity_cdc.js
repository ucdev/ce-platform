/*! app/models/activity_cdc 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_cdc
*/
define("app/models/activity_cdc",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_cdcModel = AppModel.extend({
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
