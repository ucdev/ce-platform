/*! app/models/degree_credit 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Degree_credit
*/
define("app/models/Degree_credit",function(require,app) {
	app.models.Degree_credit = app.Model.extend({
			url: function() {
				base = "/api/degree_credits/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
