/*! app/models/activity_tag_relate 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag_relate
*/
define("app/models/activity_tag_relate",["require","app"],function(require,app) {
	var Activity_tag_relateModel = app.Model.extend({
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
