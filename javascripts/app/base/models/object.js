/*! app/models/object 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Object
*/
define("app/models/object",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectModel = AppModel.extend({
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
