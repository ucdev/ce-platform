/*! app/models/processmanager 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Processmanager
*/
define("app/models/processmanager",["require"],function(require) {
	var AppModel = require("app/model");
	var ProcessmanagerModel = AppModel.extend({
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
