/*! app/models/assessment 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessment
*/
define("app/models/assessment",["require"],function(require) {
	var AppModel = require("app/model");
	var AssessmentModel = AppModel.extend({
		url: function() {
			base = "/api/assessments/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssessmentModel)
});
