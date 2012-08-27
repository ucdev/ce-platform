/*! app/models/degree_credit 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Degree_credit
*/
define("app/models/degree_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Degree_creditModel = AppModel.extend({
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
