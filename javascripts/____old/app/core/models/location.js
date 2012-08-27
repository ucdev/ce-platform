/*! app/models/location 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Location
*/
define("app/models/Location",function(require,app) {
	app.models.Location = app.Model.extend({
			url: function() {
				base = "/api/locations/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
