/*! app/models/entity_credit 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_credit
*/
define("app/models/Entity_credit",function(require,app) {
	app.models.Entity_credit = app.Model.extend({
			url: function() {
				base = "/api/entity_credits/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
