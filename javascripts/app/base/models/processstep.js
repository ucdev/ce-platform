/*! app/models/processstep 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Processstep
*/
define("app/models/processstep",["require"],function(require) {
	var AppModel = require("app/model");
	var ProcessstepModel = AppModel.extend({
		url: function() {
			base = "/api/processsteps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProcessstepModel)
});
