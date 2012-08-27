/*! app/models/occupation 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Occupation
*/
define("app/models/occupation",["require","app"],function(require,app) {
	var OccupationModel = app.Model.extend({
		url: function() {
			base = "/api/occupations/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(OccupationModel)
});
