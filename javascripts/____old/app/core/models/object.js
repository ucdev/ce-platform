/*! app/models/object 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Object
*/
define("app/models/Object",function(require,app) {
	app.models.Object = app.Model.extend({
			url: function() {
				base = "/api/objects/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
