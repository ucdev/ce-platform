/*! app/models/objectfield 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objectfield
*/
define("app/models/objectfield",["require","app"],function(require,app) {
	var ObjectfieldModel = app.Model.extend({
		url: function() {
			base = "/api/objectfields/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectfieldModel)
});
