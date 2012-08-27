/*! app/models/entity_person 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_person
*/
define("app/models/entity_person",["require","app"],function(require,app) {
	var Entity_personModel = app.Model.extend({
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
