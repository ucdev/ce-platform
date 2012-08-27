/*! app/models/assessresult 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assessresult
*/
define("app/models/assessresult",["require","app"],function(require,app) {
	var AssessresultModel = app.Model.extend({
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
