/*! app/models/image 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Image
*/
define("app/models/image",["require","app"],function(require,app) {
	var ImageModel = app.Model.extend({
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
