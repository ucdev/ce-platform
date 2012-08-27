/*! app/models/process 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Process
*/
define("app/models/Process",function(require,app) {
	app.models.Process = app.Model.extend({
			url: function() {
				base = "/api/processes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
