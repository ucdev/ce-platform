/*! app/models/wheel 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Wheel
*/
define("app/models/wheel",["require","app"],function(require,app) {
	var WheelModel = app.Model.extend({
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
