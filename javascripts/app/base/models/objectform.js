/*! app/models/objectform 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectform
*/
define("app/models/objectform",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectformModel = AppModel.extend({
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
