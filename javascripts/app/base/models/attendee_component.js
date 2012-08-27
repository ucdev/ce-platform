/*! app/models/attendee_component 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_component
*/
define("app/models/attendee_component",["require"],function(require) {
	var AppModel = require("app/model");
	var Attendee_componentModel = AppModel.extend({
		url: function() {
			base = "/api/attendee_components/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Attendee_componentModel)
});
