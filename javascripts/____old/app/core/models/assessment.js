/*! app/models/assessment 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessment
*/
define("app/models/Assessment",function(require,app) {
	app.models.Assessment = app.Model.extend({
			url: function() {
				base = "/api/assessments/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
