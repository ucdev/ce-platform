/*! app/models/activity_pubcomponent 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubcomponent
*/
define("app/models/activity_pubcomponent",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_pubcomponentModel = AppModel.extend({
		url: function() {
			base = "/api/activity_pubcomponents/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_pubcomponentModel)
});
