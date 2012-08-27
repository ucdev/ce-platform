/*! app/models/objectform 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectform
*/
define("app/models/Objectform",function(require,app) {
	app.models.Objectform = app.Model.extend({
			url: function() {
				base = "/api/objectforms/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
