/*! app/models/entity_entityrole 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_entityrole
*/
define("app/models/entity_entityrole",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_entityroleModel = AppModel.extend({
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
