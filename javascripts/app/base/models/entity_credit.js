/*! app/models/entity_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_credit
*/
define("app/models/entity_credit",["require","app"],function(require,app) {
	var Entity_creditModel = app.Model.extend({
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
