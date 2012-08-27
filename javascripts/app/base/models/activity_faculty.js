/*! app/models/activity_faculty 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_faculty
*/
define("app/models/activity_faculty",["require","app"],function(require,app) {
	var Activity_facultyModel = app.Model.extend({
		url: function() {
			base = "/api/activity_faculties/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_facultyModel)
});
