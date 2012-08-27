/*! app/models/assessanswer 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessanswer
*/
define("app/models/assessanswer",["require"],function(require) {
	var AppModel = require("app/model");
	var AssessanswerModel = AppModel.extend({
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
