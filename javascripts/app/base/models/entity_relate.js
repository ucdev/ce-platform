/*! app/models/entity_relate 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_relate
*/
define("app/models/entity_relate",["require","app"],function(require,app) {
	var Entity_relateModel = app.Model.extend({
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
