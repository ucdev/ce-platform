/*! app/models/objectform 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objectform
*/
define("app/models/objectform",["require","app"],function(require,app) {
	var ObjectformModel = app.Model.extend({
		url: function() {
			base = "/api/objectforms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectformModel)
});
