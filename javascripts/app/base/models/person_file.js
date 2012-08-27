/*! app/models/person_file 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_file
*/
define("app/models/person_file",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_fileModel = AppModel.extend({
		url: function() {
			base = "/api/person_files/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_fileModel)
});
