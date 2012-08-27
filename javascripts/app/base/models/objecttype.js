/*! app/models/objecttype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objecttype
*/
define("app/models/objecttype",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjecttypeModel = AppModel.extend({
		url: function() {
			base = "/api/objecttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjecttypeModel)
});
