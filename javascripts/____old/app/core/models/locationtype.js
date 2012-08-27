/*! app/models/locationtype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Locationtype
*/
define("app/models/Locationtype",function(require,app) {
	app.models.Locationtype = app.Model.extend({
			url: function() {
				base = "/api/locationtypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
