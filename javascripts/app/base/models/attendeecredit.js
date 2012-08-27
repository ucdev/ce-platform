/*! app/models/attendeecredit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendeecredit
*/
define("app/models/attendeecredit",["require","app"],function(require,app) {
	var AttendeecreditModel = app.Model.extend({
		url: function() {
			base = "/api/attendeecredits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AttendeecreditModel)
});
