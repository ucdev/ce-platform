/*! app/models/assesssection 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assesssection
*/
define("app/models/assesssection",["require","app"],function(require,app) {
	var AssesssectionModel = app.Model.extend({
		url: function() {
			base = "/api/assesssections/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssesssectionModel)
});
