/*! app/models/activity_tag_relate 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag_relate
*/
define("app/models/activity_tag_relate",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_tag_relateModel = AppModel.extend({
		url: function() {
			base = "/api/activity_tag_relates/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_tag_relateModel)
});
