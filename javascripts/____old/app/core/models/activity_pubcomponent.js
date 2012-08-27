/*! app/models/activity_pubcomponent 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubcomponent
*/
define("app/models/Activity_pubcomponent",function(require,app) {
	app.models.Activity_pubcomponent = app.Model.extend({
			url: function() {
				base = "/api/activity_pubcomponents/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
