/*! app/models/attendee_component 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_component
*/
define("app/models/Attendee_component",function(require,app) {
	app.models.Attendee_component = app.Model.extend({
			url: function() {
				base = "/api/attendee_components/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
