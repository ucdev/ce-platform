/*! app/models/processmanager 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Processmanager
*/
define("app/models/processmanager",["require","app"],function(require,app) {
	var ProcessmanagerModel = app.Model.extend({
		url: function() {
			base = "/api/processmanagers/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProcessmanagerModel)
});
