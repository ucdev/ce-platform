/*! app/models/processstep 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Processstep
*/
define("app/models/processstep",["require","app"],function(require,app) {
	var ProcessstepModel = app.Model.extend({
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
