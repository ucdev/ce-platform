/*! app/models/assessquestion 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assessquestion
*/
define("app/models/assessquestion",["require","app"],function(require,app) {
	var AssessquestionModel = app.Model.extend({
		url: function() {
			base = "/api/assessquestions/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssessquestionModel)
});
