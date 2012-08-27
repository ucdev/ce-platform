/*! app/models/attendeecredit 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendeecredit
*/
define("app/models/attendeecredit",["require"],function(require) {
	var AppModel = require("app/model");
	var AttendeecreditModel = AppModel.extend({
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
