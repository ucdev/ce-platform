/*! app/models/activity_faculty 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_faculty
*/
define("app/models/Activity_faculty",function(require,app) {
	app.models.Activity_faculty = app.Model.extend({
			url: function() {
				base = "/api/activity_faculties/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
