/*! app/models/file 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.File
*/
define("app/models/file",["require","app"],function(require,app) {
	var FileModel = app.Model.extend({
		url: function() {
			base = "/api/files/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(FileModel)
});
