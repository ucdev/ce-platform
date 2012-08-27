/*! app/models/entity_entitytype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_entitytype
*/
define("app/models/entity_entitytype",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_entitytypeModel = AppModel.extend({
		url: function() {
			base = "/api/entity_entitytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_entitytypeModel)
});
