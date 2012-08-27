/*! app/models/activity_finfee 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finfee
*/
define("app/models/Activity_finfee",function(require,app) {
	app.models.Activity_finfee = app.Model.extend({
			url: function() {
				base = "/api/activity_finfees/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
