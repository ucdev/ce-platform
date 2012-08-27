/*! app/models/entity_entityrole 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_entityrole
*/
define("app/models/Entity_entityrole",function(require,app) {
	app.models.Entity_entityrole = app.Model.extend({
			url: function() {
				base = "/api/entity_entityroles/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
