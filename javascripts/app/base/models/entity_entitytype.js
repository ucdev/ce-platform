/*! app/models/entity_entitytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_entitytype
*/
define("app/models/entity_entitytype",["require","app"],function(require,app) {
	var Entity_entitytypeModel = app.Model.extend({
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
