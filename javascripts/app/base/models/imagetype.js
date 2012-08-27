/*! app/models/imagetype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Imagetype
*/
define("app/models/imagetype",["require"],function(require) {
	var AppModel = require("app/model");
	var ImagetypeModel = AppModel.extend({
		url: function() {
			base = "/api/imagetypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ImagetypeModel)
});
