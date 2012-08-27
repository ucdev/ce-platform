/*! app/models/activity_specialtylm 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_specialtylm
*/
define("app/models/activity_specialtylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_specialtylmModel = AppModel.extend({
		url: function() {
			base = "/api/activity_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_specialtylmModel)
});
