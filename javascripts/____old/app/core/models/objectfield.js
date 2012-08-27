/*! app/models/objectfield 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectfield
*/
define("app/models/Objectfield",function(require,app) {
	app.models.Objectfield = app.Model.extend({
			url: function() {
				base = "/api/objectfields/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
