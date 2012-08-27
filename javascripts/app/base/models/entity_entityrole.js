/*! app/models/entity_entityrole 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_entityrole
*/
define("app/models/entity_entityrole",["require","app"],function(require,app) {
	var Entity_entityroleModel = app.Model.extend({
		url: function() {
			base = "/api/entity_entityroles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_entityroleModel)
});
