/*! app/models/processmanager 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Processmanager
*/
define("app/models/Processmanager",function(require,app) {
	app.models.Processmanager = app.Model.extend({
			url: function() {
				base = "/api/processmanagers/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
