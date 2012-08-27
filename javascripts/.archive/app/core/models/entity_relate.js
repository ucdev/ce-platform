/*! app/models/entity_relate 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_relate
*/
define("app/models/Entity_relate",function(require,app) {
	app.models.Entity_relate = app.Model.extend({
			url: function() {
				base = "/api/entity_relates/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
