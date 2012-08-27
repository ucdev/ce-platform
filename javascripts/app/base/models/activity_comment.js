/*! app/models/activity_comment 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_comment
*/
define("app/models/activity_comment",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_commentModel = AppModel.extend({
		url: function() {
			base = "/api/activity_comments/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_commentModel)
});
