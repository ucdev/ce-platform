/*! app/models/process 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Process
*/
define("app/models/process",["require"],function(require) {
	var AppModel = require("app/model");
	var ProcessModel = AppModel.extend({
		url: function() {
			base = "/api/processes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProcessModel)
});
