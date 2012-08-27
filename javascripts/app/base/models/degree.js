/*! app/models/degree 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Degree
*/
define("app/models/degree",["require","app"],function(require,app) {
	var DegreeModel = app.Model.extend({
		url: function() {
			base = "/api/degrees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(DegreeModel)
});
