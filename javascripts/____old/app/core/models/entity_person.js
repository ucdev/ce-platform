/*! app/models/entity_person 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_person
*/
define("app/models/Entity_person",function(require,app) {
	app.models.Entity_person = app.Model.extend({
			url: function() {
				base = "/api/entity_persons/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
