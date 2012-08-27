/*! app/models/process_person 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Process_person
*/
define("app/models/process_person",["require"],function(require) {
	var AppModel = require("app/model");
	var Process_personModel = AppModel.extend({
		url: function() {
			base = "/api/process_persons/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Process_personModel)
});
