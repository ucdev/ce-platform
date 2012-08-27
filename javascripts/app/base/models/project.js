/*! app/models/project 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Project
*/
define("app/models/project",["require","app"],function(require,app) {
	var ProjectModel = app.Model.extend({
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
