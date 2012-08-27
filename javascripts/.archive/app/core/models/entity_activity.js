/*! app/models/entity_activity 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_activity
*/
define("app/models/Entity_activity",function(require,app) {
	app.models.Entity_activity = app.Model.extend({
			url: function() {
				base = "/api/entity_activities/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
