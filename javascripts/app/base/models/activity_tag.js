/*! app/models/activity_tag 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag
*/
define("app/models/activity_tag",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_tagModel = AppModel.extend({
		url: function() {
			base = "/api/activity_tags/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_tagModel)
});
