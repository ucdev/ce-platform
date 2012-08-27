/*! app/models/assessresult 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessresult
*/
define("app/models/Assessresult",function(require,app) {
	app.models.Assessresult = app.Model.extend({
			url: function() {
				base = "/api/assessresults/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
