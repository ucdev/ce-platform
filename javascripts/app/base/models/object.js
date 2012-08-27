/*! app/models/object 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Object
*/
define("app/models/object",["require","app"],function(require,app) {
	var ObjectModel = app.Model.extend({
		url: function() {
			base = "/api/objects/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectModel)
});
