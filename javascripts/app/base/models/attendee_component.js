/*! app/models/attendee_component 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee_component
*/
define("app/models/attendee_component",["require","app"],function(require,app) {
	var Attendee_componentModel = app.Model.extend({
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
