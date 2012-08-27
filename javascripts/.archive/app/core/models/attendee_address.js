/*! app/models/attendee_address 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_address
*/
define("app/models/Attendee_address",function(require,app) {
	app.models.Attendee_address = app.Model.extend({
			url: function() {
				base = "/api/attendee_addresses/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
