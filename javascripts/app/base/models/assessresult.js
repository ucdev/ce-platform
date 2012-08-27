/*! app/models/assessresult 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessresult
*/
define("app/models/assessresult",["require"],function(require) {
	var AppModel = require("app/model");
	var AssessresultModel = AppModel.extend({
		url: function() {
			base = "/api/assessresults/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssessresultModel)
});
