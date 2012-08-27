/*! app/models/history 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.History
*/
define("app/models/History",function(require,app) {
	app.models.History = app.Model.extend({
			url: function() {
				base = "/api/histories/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
