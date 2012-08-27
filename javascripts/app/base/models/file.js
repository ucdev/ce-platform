/*! app/models/file 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.File
*/
define("app/models/file",["require"],function(require) {
	var AppModel = require("app/model");
	var FileModel = AppModel.extend({
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
