/*! app/models/activity_comment 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_comment
*/
define("app/models/activity_comment",["require","app"],function(require,app) {
	var Activity_commentModel = app.Model.extend({
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
