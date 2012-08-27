/*! app/models/entity_credit 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_credit
*/
define("app/models/entity_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_creditModel = AppModel.extend({
		url: function() {
			base = "/api/entity_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_creditModel)
});
