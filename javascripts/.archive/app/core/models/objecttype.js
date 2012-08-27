/*! app/models/objecttype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Objecttype
*/
define("app/models/Objecttype",function(require,app) {
	app.models.Objecttype = app.Model.extend({
			url: function() {
				base = "/api/objecttypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
