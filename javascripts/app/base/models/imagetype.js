/*! app/models/imagetype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Imagetype
*/
define("app/models/imagetype",["require","app"],function(require,app) {
	var ImagetypeModel = app.Model.extend({
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
