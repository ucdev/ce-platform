/*! app/models/activity_finsupport 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finsupport
*/
define("app/models/Activity_finsupport",function(require,app) {
	app.models.Activity_finsupport = app.Model.extend({
			url: function() {
				base = "/api/activity_finsupports/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
