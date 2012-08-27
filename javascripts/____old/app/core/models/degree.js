/*! app/models/degree 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Degree
*/
define("app/models/Degree",function(require,app) {
	app.models.Degree = app.Model.extend({
			url: function() {
				base = "/api/degrees/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
