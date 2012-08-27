/*! app/models/objectdatum 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectdatum
*/
define("app/models/objectdatum",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectdatumModel = AppModel.extend({
		url: function() {
			base = "/api/objectdatas/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectdatumModel)
});
