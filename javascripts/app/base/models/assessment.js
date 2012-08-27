/*! app/models/assessment 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assessment
*/
define("app/models/assessment",["require","app"],function(require,app) {
	var AssessmentModel = app.Model.extend({
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
