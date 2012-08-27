/*! app/models/model 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Model
*/
define("app/models/Model",function(require,app) {
	app.models.Model = app.Model.extend({
			url: function() {
				base = "/api/models/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
