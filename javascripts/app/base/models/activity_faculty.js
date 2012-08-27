/*! app/models/activity_faculty 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_faculty
*/
define("app/models/activity_faculty",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_facultyModel = AppModel.extend({
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
