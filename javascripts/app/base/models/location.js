/*! app/models/location 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Location
*/
define("app/models/location",["require","app"],function(require,app) {
	var LocationModel = app.Model.extend({
		url: function() {
			base = "/api/locations/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(LocationModel)
});
