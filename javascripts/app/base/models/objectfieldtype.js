/*! app/models/objectfieldtype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectfieldtype
*/
define("app/models/objectfieldtype",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectfieldtypeModel = AppModel.extend({
		url: function() {
			base = "/api/objectfieldtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectfieldtypeModel)
});
