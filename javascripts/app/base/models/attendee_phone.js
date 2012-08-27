/*! app/models/attendee_phone 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_phone
*/
define("app/models/attendee_phone",["require"],function(require) {
	var AppModel = require("app/model");
	var Attendee_phoneModel = AppModel.extend({
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
