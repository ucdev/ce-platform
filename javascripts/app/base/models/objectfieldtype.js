/*! app/models/objectfieldtype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objectfieldtype
*/
define("app/models/objectfieldtype",["require","app"],function(require,app) {
	var ObjectfieldtypeModel = app.Model.extend({
		url: function() {
			base = "/api/objectfieldtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectfieldtypeModel)
});
