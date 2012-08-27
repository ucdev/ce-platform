/*! app/models/objectdatum 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectdatum
*/
define("app/models/Objectdatum",function(require,app) {
	app.models.Objectdatum = app.Model.extend({
			url: function() {
				base = "/api/objectdatas/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
