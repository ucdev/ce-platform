/*! app/models/activity_tag 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag
*/
define("app/models/Activity_tag",function(require,app) {
	app.models.Activity_tag = app.Model.extend({
			url: function() {
				base = "/api/activity_tags/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
