/*! app/models/project 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Project
*/
define("app/models/project",["require"],function(require) {
	var AppModel = require("app/model");
	var ProjectModel = AppModel.extend({
		url: function() {
			base = "/api/projects/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProjectModel)
});
