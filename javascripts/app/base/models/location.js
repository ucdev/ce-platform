/*! app/models/location 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Location
*/
define("app/models/location",["require"],function(require) {
	var AppModel = require("app/model");
	var LocationModel = AppModel.extend({
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
