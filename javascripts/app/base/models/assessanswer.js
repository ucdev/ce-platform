/*! app/models/assessanswer 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assessanswer
*/
define("app/models/assessanswer",["require","app"],function(require,app) {
	var AssessanswerModel = app.Model.extend({
		url: function() {
			base = "/api/assessanswers/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssessanswerModel)
});
