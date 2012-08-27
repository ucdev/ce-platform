/*! app/models/assessquestion 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessquestion
*/
define("app/models/assessquestion",["require"],function(require) {
	var AppModel = require("app/model");
	var AssessquestionModel = AppModel.extend({
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
