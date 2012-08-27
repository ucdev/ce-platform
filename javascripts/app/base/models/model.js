/*! app/models/model 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Model
*/
define("app/models/model",["require"],function(require) {
	var AppModel = require("app/model");
	var ModelModel = AppModel.extend({
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
