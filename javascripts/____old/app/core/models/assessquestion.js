/*! app/models/assessquestion 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessquestion
*/
define("app/models/Assessquestion",function(require,app) {
	app.models.Assessquestion = app.Model.extend({
			url: function() {
				base = "/api/assessquestions/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
