/*! app/models/project 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Project
*/
define("app/models/Project",function(require,app) {
	app.models.Project = app.Model.extend({
			url: function() {
				base = "/api/projects/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
