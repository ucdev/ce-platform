/*! app/models/activity_finfee 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finfee
*/
define("app/models/activity_finfee",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_finfeeModel = AppModel.extend({
		url: function() {
			base = "/api/activity_finfees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finfeeModel)
});
