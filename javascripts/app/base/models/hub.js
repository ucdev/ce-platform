/*! app/models/hub 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Hub
*/
define("app/models/hub",["require","app"],function(require,app) {
	var HubModel = app.Model.extend({
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
