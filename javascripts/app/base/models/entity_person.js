/*! app/models/entity_person 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_person
*/
define("app/models/entity_person",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_personModel = AppModel.extend({
		url: function() {
			base = "/api/entity_persons/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_personModel)
});
