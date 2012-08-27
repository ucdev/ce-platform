/*! app/models/image 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Image
*/
define("app/models/image",["require"],function(require) {
	var AppModel = require("app/model");
	var ImageModel = AppModel.extend({
		url: function() {
			base = "/api/images/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ImageModel)
});
