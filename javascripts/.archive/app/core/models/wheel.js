/*! app/models/wheel 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Wheel
*/
define("app/models/Wheel",function(require,app) {
	app.models.Wheel = app.Model.extend({
			url: function() {
				base = "/api/wheels/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
