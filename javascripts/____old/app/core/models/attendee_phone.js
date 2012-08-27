/*! app/models/attendee_phone 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_phone
*/
define("app/models/Attendee_phone",function(require,app) {
	app.models.Attendee_phone = app.Model.extend({
			url: function() {
				base = "/api/attendee_phones/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
