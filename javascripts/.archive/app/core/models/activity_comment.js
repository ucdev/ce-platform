/*! app/models/activity_comment 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_comment
*/
define("app/models/Activity_comment",function(require,app) {
	app.models.Activity_comment = app.Model.extend({
			url: function() {
				base = "/api/activity_comments/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
