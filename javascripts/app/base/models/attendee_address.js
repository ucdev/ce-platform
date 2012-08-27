/*! app/models/attendee_address 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee_address
*/
define("app/models/attendee_address",["require","app"],function(require,app) {
	var Attendee_addressModel = app.Model.extend({
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
