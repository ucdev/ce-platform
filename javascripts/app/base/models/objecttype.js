/*! app/models/objecttype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objecttype
*/
define("app/models/objecttype",["require","app"],function(require,app) {
	var ObjecttypeModel = app.Model.extend({
		url: function() {
			base = "/api/objecttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjecttypeModel)
});
