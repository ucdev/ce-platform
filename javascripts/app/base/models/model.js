/*! app/models/model 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Model
*/
define("app/models/model",["require","app"],function(require,app) {
	var ModelModel = app.Model.extend({
		url: function() {
			base = "/api/models/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ModelModel)
});
