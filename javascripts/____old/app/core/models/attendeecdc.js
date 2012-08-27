/*! app/models/attendeecdc 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendeecdc
*/
define("app/models/Attendeecdc",function(require,app) {
	app.models.Attendeecdc = app.Model.extend({
			url: function() {
				base = "/api/attendeecdcs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
