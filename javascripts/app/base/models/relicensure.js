/*! app/models/relicensure 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Relicensure
*/
define("app/models/relicensure",["require"],function(require) {
	var AppModel = require("app/model");
	var RelicensureModel = AppModel.extend({
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
