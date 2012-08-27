/*! app/models/entity 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity
*/
define("app/models/entity",["require"],function(require) {
	var AppModel = require("app/model");
	var EntityModel = AppModel.extend({
		url: function() {
			base = "/api/entities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(EntityModel)
});
