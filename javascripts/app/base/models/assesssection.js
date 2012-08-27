/*! app/models/assesssection 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assesssection
*/
define("app/models/assesssection",["require"],function(require) {
	var AppModel = require("app/model");
	var AssesssectionModel = AppModel.extend({
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
