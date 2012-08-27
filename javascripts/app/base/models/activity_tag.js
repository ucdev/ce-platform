/*! app/models/activity_tag 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag
*/
define("app/models/activity_tag",["require","app"],function(require,app) {
	var Activity_tagModel = app.Model.extend({
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
