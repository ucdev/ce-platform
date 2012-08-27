/*! app/models/attendeecredit 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendeecredit
*/
define("app/models/Attendeecredit",function(require,app) {
	app.models.Attendeecredit = app.Model.extend({
			url: function() {
				base = "/api/attendeecredits/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
