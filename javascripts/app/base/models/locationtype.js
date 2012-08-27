/*! app/models/locationtype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Locationtype
*/
define("app/models/locationtype",["require"],function(require) {
	var AppModel = require("app/model");
	var LocationtypeModel = AppModel.extend({
		url: function() {
			base = "/api/locationtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(LocationtypeModel)
});
