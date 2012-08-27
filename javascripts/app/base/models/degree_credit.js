/*! app/models/degree_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Degree_credit
*/
define("app/models/degree_credit",["require","app"],function(require,app) {
	var Degree_creditModel = app.Model.extend({
		url: function() {
			base = "/api/degree_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Degree_creditModel)
});
