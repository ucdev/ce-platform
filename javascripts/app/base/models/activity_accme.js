/*! app/models/activity_accme 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_accme
*/
define("app/models/activity_accme",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_accmeModel = AppModel.extend({
		url: function() {
			base = "/api/activity_accmes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_accmeModel)
});
