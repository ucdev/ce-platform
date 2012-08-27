/*! app/models/entity_relate 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_relate
*/
define("app/models/entity_relate",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_relateModel = AppModel.extend({
		url: function() {
			base = "/api/entity_relates/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_relateModel)
});
