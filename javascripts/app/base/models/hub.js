/*! app/models/hub 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Hub
*/
define("app/models/hub",["require"],function(require) {
	var AppModel = require("app/model");
	var HubModel = AppModel.extend({
		url: function() {
			base = "/api/hubs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(HubModel)
});
