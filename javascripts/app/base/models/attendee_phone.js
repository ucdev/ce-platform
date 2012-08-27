/*! app/models/attendee_phone 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee_phone
*/
define("app/models/attendee_phone",["require","app"],function(require,app) {
	var Attendee_phoneModel = app.Model.extend({
		url: function() {
			base = "/api/attendee_phones/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Attendee_phoneModel)
});
