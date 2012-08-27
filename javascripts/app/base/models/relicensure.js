/*! app/models/relicensure 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Relicensure
*/
define("app/models/relicensure",["require","app"],function(require,app) {
	var RelicensureModel = app.Model.extend({
		url: function() {
			base = "/api/relicensures/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(RelicensureModel)
});
