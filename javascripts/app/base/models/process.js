/*! app/models/process 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Process
*/
define("app/models/process",["require","app"],function(require,app) {
	var ProcessModel = app.Model.extend({
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
