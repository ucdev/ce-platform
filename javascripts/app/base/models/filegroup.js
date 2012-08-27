/*! app/models/filegroup 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Filegroup
*/
define("app/models/filegroup",["require"],function(require) {
	var AppModel = require("app/model");
	var FilegroupModel = AppModel.extend({
		url: function() {
			base = "/api/filegroups/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(FilegroupModel)
});
