/*! app/models/attendeecdc 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendeecdc
*/
define("app/models/attendeecdc",["require","app"],function(require,app) {
	var AttendeecdcModel = app.Model.extend({
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
