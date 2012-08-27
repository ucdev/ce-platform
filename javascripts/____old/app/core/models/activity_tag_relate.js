/*! app/models/activity_tag_relate 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag_relate
*/
define("app/models/Activity_tag_relate",function(require,app) {
	app.models.Activity_tag_relate = app.Model.extend({
			url: function() {
				base = "/api/activity_tag_relates/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
