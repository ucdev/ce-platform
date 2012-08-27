/*! app/models/wheel 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Wheel
*/
define("app/models/wheel",["require"],function(require) {
	var AppModel = require("app/model");
	var WheelModel = AppModel.extend({
		url: function() {
			base = "/api/wheels/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(WheelModel)
});
