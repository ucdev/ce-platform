/*! app/models/attendeecdc 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendeecdc
*/
define("app/models/attendeecdc",["require"],function(require) {
	var AppModel = require("app/model");
	var AttendeecdcModel = AppModel.extend({
		url: function() {
			base = "/api/attendeecdcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AttendeecdcModel)
});
