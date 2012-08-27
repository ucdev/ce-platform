/*! app/models/person_file 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_file
*/
define("app/models/person_file",["require","app"],function(require,app) {
	var Person_fileModel = app.Model.extend({
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
