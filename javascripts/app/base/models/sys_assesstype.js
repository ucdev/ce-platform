/*! app/models/sys_assesstype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_assesstype
*/
define("app/models/sys_assesstype",["require","app"],function(require,app) {
	var Sys_assesstypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_assesstypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_assesstypeModel)
});
