/*! app/models/entity_activity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_activity
*/
define("app/models/entity_activity",["require","app"],function(require,app) {
	var Entity_activityModel = app.Model.extend({
		url: function() {
			base = "/api/entity_activities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_activityModel)
});
