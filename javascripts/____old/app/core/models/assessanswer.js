/*! app/models/assessanswer 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessanswer
*/
define("app/models/Assessanswer",function(require,app) {
	app.models.Assessanswer = app.Model.extend({
			url: function() {
				base = "/api/assessanswers/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
