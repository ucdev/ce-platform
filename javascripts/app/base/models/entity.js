/*! app/models/entity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity
*/
define("app/models/entity",["require","app"],function(require,app) {
	var EntityModel = app.Model.extend({
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
