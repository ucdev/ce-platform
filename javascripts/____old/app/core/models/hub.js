/*! app/models/hub 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Hub
*/
define("app/models/Hub",function(require,app) {
	app.models.Hub = app.Model.extend({
			url: function() {
				base = "/api/hubs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
