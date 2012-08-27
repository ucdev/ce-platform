/*! app/models/objectfield 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectfield
*/
define("app/models/objectfield",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectfieldModel = AppModel.extend({
		url: function() {
			base = "/api/objectfields/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectfieldModel)
});
