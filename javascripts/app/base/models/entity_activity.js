/*! app/models/entity_activity 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_activity
*/
define("app/models/entity_activity",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_activityModel = AppModel.extend({
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
