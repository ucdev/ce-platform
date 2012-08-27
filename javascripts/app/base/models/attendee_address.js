/*! app/models/attendee_address 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_address
*/
define("app/models/attendee_address",["require"],function(require) {
	var AppModel = require("app/model");
	var Attendee_addressModel = AppModel.extend({
		url: function() {
			base = "/api/attendee_addresses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Attendee_addressModel)
});
