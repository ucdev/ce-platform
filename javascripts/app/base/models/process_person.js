/*! app/models/process_person 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Process_person
*/
define("app/models/process_person",["require","app"],function(require,app) {
	var Process_personModel = app.Model.extend({
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
